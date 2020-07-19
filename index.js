var SerialPort = require('serialport');
var fs = require('fs');

var targetPort = process.argv[2];
var sendFile = process.argv[3];

var blockSize = 32;
if(process.argv[4]) {
	blockSize = parseInt(process.argv[4]);
}

var verbose = 0;

function OpenSerialAndSend(buffer, numBytes) {
	SerialPort.list(function(err, ports) {
		var portExists = ports.some(port => port.comName == targetPort);
		if(portExists) {
			console.log(targetPort + " exists.");
		} else {
			console.log(targetPort + " does not exist.");
			return;
		}
		var myPort = new SerialPort(targetPort, 9600);
		var Readline = SerialPort.parsers.Readline;
		var parser = new Readline();

		myPort.pipe(parser);
		var bytesSent = 0;

		parser.on("data", function(data) {
			if(verbose > 0) {
				console.log("received: " + data);
			}
			if(data.trim() == "READY") {
				if(bytesSent < numBytes) {
					var bytesToSend = Math.min(numBytes - bytesSent, blockSize);
					if(verbose > 0) {
						console.log("sending next " + bytesToSend + " bytes");
					}
					myPort.write(bytesToSend.toString() + " ");
					var sliceBuf = buffer.slice(bytesSent, bytesSent + bytesToSend);
					bytesSent += bytesToSend;
					myPort.write(sliceBuf);
					if(verbose == 0) {
						var progress = Math.floor(100 * bytesSent / numBytes).toString().padStart(2, "0");
						process.stdout.cursorTo(0);
						process.stdout.write("transferred " + progress + "% - " + bytesSent + "/" + numBytes);
					}
				} else {
					console.log(\n"Transfer complete.");
					myPort.close();
				}
			}
		});
	});
}

console.log("Sending " + sendFile + " to EEPROM programmer on " + targetPort);
fs.open(sendFile, 'r', function(status, fd) {
	if(status) {
		console.log("status?");
		console.log(status.message);
		return;
	}
	var buffer = Buffer.alloc(8192);
	fs.read(fd, buffer, 0, 8192, 0, function(err, bytesRead, buf) {
		if(err) {
			console.log("ERROR");
		} else {
			console.log("read " + bytesRead + " bytes. Opening serial port...");
			OpenSerialAndSend(buf, bytesRead);
		}
	});
});