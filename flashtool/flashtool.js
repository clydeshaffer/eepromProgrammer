var SerialPort = require('serialport');
var fs = require('fs');
var readline = require('readline');
const { type } = require('os');
var argv = require('minimist')(process.argv.slice(2));

var targetPort = argv.p;
var targetFileName = argv.f;

var blockSize = 4096;
var slidingWindowSize = 16384;

var responseParser = new SerialPort.parsers.Delimiter({
	delimiter : "\r",
	includeDelimiter: false
});

var chunkParser = new SerialPort.parsers.ByteLength({
	length : blockSize
});

function SerialConnect(andThen) {
	SerialPort.list().then((ports) => {
		var portExists = ports.some(port => port.comName == targetPort);
		if(portExists) {
			console.log(targetPort + " exists.");
		} else {
			console.log(targetPort + " does not exist.");
			return;
		}
		var myPort = new SerialPort(targetPort, 9600);
		andThen(myPort);
	});
}

function OpenSerialAndSend(buffer, startSector, startOffset, numBytes) {
	SerialConnect(function(myPort) {
		
		var bytesSent = 0;
		var confirmStep = 0;
		var slidingWindowPosition = startSector;

		function sendNext() {
			if(bytesSent < numBytes) {
				var bytesToSend = Math.min(numBytes - bytesSent, blockSize);
				myPort.write("shift " + slidingWindowPosition.toString(16) + "\r");
				var offset = (bytesSent + startOffset) % slidingWindowSize;
				myPort.write("writeMulti " + offset.toString(16) + " " + bytesToSend.toString(16) + "\r");
				var sliceBuf = buffer.slice(bytesSent, bytesSent + bytesToSend);
				bytesSent += bytesToSend;
				if(bytesSent % slidingWindowSize == 0) {
					slidingWindowPosition++;
				}
				myPort.write(sliceBuf);
				var progress = Math.floor(100 * bytesSent / numBytes).toString().padStart(2, "0");
				readline.cursorTo(process.stdout, 0);
				process.stdout.write("transferred " + progress + "% - " + bytesSent + "/" + numBytes);
			} else {
				console.log("\nTransfer complete.");
				myPort.close();
			}
		}

		responseParser.on("data", function(databuf) {
			var data = databuf.toString();
			if(confirmStep == 0 && data.trim() == "Ready!") {
				confirmStep++;
				if(argv.eeprom) {
					myPort.write("mode e\r");
				}
				myPort.write("version\r");
			} else if(confirmStep == 1 && data.trim().substring(0,7) == "GTCP2-0") {
				confirmStep = 2;
				sendNext();
			} else if(confirmStep == 2 && data.trim().substring(0,3) == "ACK") {
				sendNext();
			} else if(confirmStep == 2 && data.trim().toLowerCase().substring(0,4) == "dump") {

			}
		});

		myPort.pipe(responseParser);
	});
}

function OpenSerialAndDump(outFileStream, startSector, startOffset, numBytes) {
	SerialConnect(function(myPort) {
		var confirmStep = 0;
		var bytesReceived = 0;

		chunkParser.on("data", function(databuf) {
			bytesReceived += Buffer.byteLength(databuf);
			outFileStream.write(databuf);
			if(bytesReceived == numBytes) {
				console.log("Done! " + numBytes + " written to " + targetFileName);
				myPort.close();
				outFileStream.close();
			} else if (bytesReceived > numBytes) {
				console.error("too many bytes have been returned, probably a bug");
			}
		});

		responseParser.on("data", function(databuf) {
			var data = databuf.toString();
			if(confirmStep == 0 && data.trim() == "Ready!") {
				confirmStep++;
				if(argv.eeprom) {
					myPort.write("mode e\r");
				} else {
					myPort.write("mode f\r");
				}
				myPort.write("version\r");
			} else if(confirmStep == 1 && data.trim().substring(0,7) == "GTCP2-0") {
				confirmStep = 2;
				var longAddr = (startSector << 14) | startOffset;
				myPort.write("dump " + longAddr.toString(16) + " " + numBytes.toString(16) + "\r");
			} else if(confirmStep == 2 && data.trim().toLowerCase().substring(0,4) == "dump") {
				myPort.unpipe(responseParser);
				myPort.pipe(chunkParser);
			}
		});

		
		myPort.pipe(responseParser);
	});
}


/////main stuff

var startSector = 0;
var startOffset = 0;

if(argv.s || argv.start) {
	var startAt = parseInt(argv.s || argv.start);
	startSector = Math.floor(startAt / slidingWindowSize);
	startOffset = startAt % slidingWindowSize;
} else {
	if(argv.sector) {
		startSector = parseInt(argv.sector);
	}

	if(argv.offset) {
		startOffset = parseInt(argv.offset);
	}
}

if(argv.listports) {
	SerialPort.list(function(err, ports) {
		console.log(ports);
	});
	return;
}

console.log("Flashtool v0.1.1");

if(isNaN(startSector) || isNaN(startOffset)) {
	console.error("Error! startSector and startOffset should be numbers!!");
	return;
}

function parseSize(s) {
	var num = parseInt(s);
	var unit = (s.match(/[\d.\-\+]*\s*(.*)/)[1] || '').toLowerCase();
	if(unit == "m") {
		num = num << 20
	} else if(unit == "k") {
		num = num << 10;
	}
	return num;
}

if(argv.dump) {
	var bytesToRead = parseSize(argv.dump);
	if((bytesToRead > 0) && (bytesToRead <= 1<<21)) {
		console.log("Dumping " + bytesToRead + " bytes from programmer on port " + targetPort);
		var writeStream = fs.createWriteStream(targetFileName);
		OpenSerialAndDump(writeStream, startSector, startOffset, bytesToRead);
	} else {
		console.error("Hey! dump should be a number of bytes greater than zero and less than 2MB");
	}
} else {
	console.log("Sending " + targetFileName + " to programmer on " + targetPort);
	fs.open(targetFileName, 'r', function(status, fd) {
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
				OpenSerialAndSend(buf, startSector, startOffset, bytesRead);
			}
		});
	});
}