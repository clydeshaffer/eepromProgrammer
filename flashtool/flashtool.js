var SerialPort = require('serialport');
var fs = require('fs');

var targetPort = process.argv[2];
var sendFile = process.argv[3];

var blockSize = 4096;
if(process.argv[4]) {
	blockSize = parseInt(process.argv[4]);
}

function OpenSerialAndSend(buffer, numBytes) {
	SerialPort.list(function(err, ports) {
		console.log(ports);
		var portExists = ports.some(port => port.comName == targetPort);
		if(portExists) {
			console.log(targetPort + " exists.");
		} else {
			console.log(targetPort + " does not exist.");
			return;
		}
		var myPort = new SerialPort(targetPort, 9600);
		var Delimiter = SerialPort.parsers.Delimiter;
		var parser = new Delimiter({
			delimiter : "\r",
			includeDelimiter: false
		});

		var bytesSent = 0;
		var confirmStep = 0;
		var slidingWindowSize = 16384;
		var slidingWindowPosition = 0;


		parser.on("data", function(databuf) {
			var data = databuf.toString();
			if(confirmStep == 0 && data.trim() == "Ready!") {
				confirmStep++;
				myPort.write("version\r");
			} else if((confirmStep == 1 && data.trim().substring(0,7) == "GTCP2-0")
				|| (confirmStep == 2 && data.trim().substring(0,3) == "ACK")) {
				confirmStep = 2;
				if(bytesSent < numBytes) {
					var bytesToSend = Math.min(numBytes - bytesSent, blockSize);
					myPort.write("shift " + slidingWindowPosition.toString(16) + "\r");
					var offset = bytesSent % slidingWindowSize;
					myPort.write("writeMulti " + offset.toString(16) + " " + bytesToSend.toString(16) + "\r");
					var sliceBuf = buffer.slice(bytesSent, bytesSent + bytesToSend);
					bytesSent += bytesToSend;
					if(bytesSent % slidingWindowSize == 0) {
						slidingWindowPosition++;
					}
					myPort.write(sliceBuf);
					var progress = Math.floor(100 * bytesSent / numBytes).toString().padStart(2, "0");
					process.stdout.cursorTo(0);
					process.stdout.write("transferred " + progress + "% - " + bytesSent + "/" + numBytes);
				} else {
					console.log("\nTransfer complete.");
					myPort.close();
				}
			} else {
			}
		});

		myPort.pipe(parser);

		myPort.write("\r");
	});
}

console.log("Flashtool v0.1.0");
console.log("Sending " + sendFile + " to programmer on " + targetPort);
fs.open(sendFile, 'r', function(status, fd) {
	if(status) {
		console.log("status?");
		console.log(status.message);
		return;
	}
	var buffer = Buffer.alloc(2097152);
	fs.read(fd, buffer, 0, 2097152, 0, function(err, bytesRead, buf) {
		if(err) {
			console.log("ERROR");
		} else {
			console.log("read " + bytesRead + " bytes. Opening serial port...");
			OpenSerialAndSend(buf, bytesRead);
		}
	});
});