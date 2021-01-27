#define OutputEnablePin 2
#define WriteEnablePin 4
#define ResetPin 3
#define ClkPin 10
#define IRQPin 11
#define ReadyPin 12

#define MISOPin 50
#define MOSIPin 51 //BANK_SER
#define SCKPin  52 //BANK_CLK
#define SSPin   53 //BANK_DONE

#include <string.h>
#include <SimpleSerialShell.h>

#define MODE_EEPROM 0
#define MODE_FLASH 1

int program_mode = MODE_FLASH;

void set_address(unsigned int x) {
  //set pins corresponding to A0-A15 to the value of x
  //A0 through A7 are on Port A
  //A8 through A15 are on Port C
  unsigned char addr_low = x & 0xFF;
  unsigned char addr_high = (x >> 8) & 0xFF;
  PORTA = addr_low;
  
  addr_high &= 0x7F;
  PORTC = addr_high;
}

unsigned char lastBankNum = 0x7F;
void shift_bank(unsigned char banknum) {
  //Flash cartridge uses a shift register to set high address pins
  //This uses the low 7 bits of banknum
  digitalWrite(SSPin, LOW);
  shiftOut(MOSIPin, SCKPin, MSBFIRST, banknum);
  digitalWrite(SSPin, HIGH);
  lastBankNum = banknum;
}

unsigned long wait_for_ready() {
  unsigned long waiting_count = 0;
  while(digitalRead(ReadyPin) == LOW) {
    waiting_count++;
  }
  return waiting_count;
}

unsigned char read_data() {
  //data pins map to port L
  //setting these as inputs to prepare to read data
  DDRL = 0x00;
  PORTL = 0x00;
  digitalWrite(OutputEnablePin, LOW);
  unsigned char data = (unsigned char) PINL;
  digitalWrite(OutputEnablePin, HIGH);
  return data;
}

void write_data(unsigned char data) {
  //set the data pins and strobe Write Enable LOW
  PORTL = data;
  DDRL = 0xFF;
  digitalWrite(WriteEnablePin, LOW);
  digitalWrite(WriteEnablePin, HIGH);
  PORTL = 0x00;
  DDRL = 0x00;
}

void write_to(unsigned int addr, unsigned char data) {
  set_address(addr);
  write_data(data);
}

void flash_cmd_unlock() {
  write_to(0xAAA, 0xAA);
  write_to(0x555, 0x55);
}

void flash_cmd_chip_erase() {
  flash_cmd_unlock();
  write_to(0xAAA, 0x80);
  flash_cmd_unlock();
  write_to(0xAAA, 0x10);
}

void flash_cmd_program_to(unsigned int addr, unsigned char data) {
  flash_cmd_unlock();
  write_to(0xAAA, 0xA0);
  write_to(addr, data);
}

void flash_cmd_unlock_bypass() {
  flash_cmd_unlock();
  write_to(0xAAA, 0x20);
}

void flash_cmd_bypass_write_to(unsigned int addr, unsigned char data) {
  set_address(addr);
  write_data(0xA0);
  write_data(data);
}

void flash_cmd_unlock_bypass_reset() {
  write_data(0x90);
  write_data(0x00);
}

void print_mode() {
  if(program_mode == MODE_EEPROM) {
    Serial.print("EEPROM");
  } else if(program_mode == MODE_FLASH) {
    Serial.print("FLASH");
  } else {
    Serial.print("UNDEFINED");
  }
}

//Shell commands start
int cmd_readAt(int argc, char **argv) {
  if(argc < 2) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  set_address(addr);
  Serial.println(read_data(), HEX);
  return 0;
}

int cmd_eraseChip(int argc, char **argv) {
  Serial.println("Starting chip erase...");
  flash_cmd_chip_erase();
  unsigned long cnt = wait_for_ready();
  Serial.print("Done ");
  Serial.println(cnt);
  return 0;
}

int cmd_writeTo(int argc, char **argv) {
  if(argc < 3) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int data = strtol(argv[2], NULL, 16);
  if(program_mode == MODE_FLASH) {
    Serial.print("Writing $");
    Serial.print((unsigned char) data, HEX);
    Serial.print(" to $");
    Serial.println(addr, HEX);
    flash_cmd_program_to(addr, (unsigned char) data);
    Serial.print(wait_for_ready());
    Serial.println("... Done");
    return 0;
  } else {
    write_to(addr, (unsigned char) data);
    return 0;
  }
}

int cmd_shift(int argc, char **argv) {
  if(argc < 2) {
    return 0;
  }
  unsigned char addr = strtol(argv[1], NULL, 16);
  shift_bank(addr); 
  return 0;
}

int cmd_mode(int argc, char **argv) {
  if(argc > 1) {
    if(argv[1][0] == 'e' || argv[1][0] == 'E') {
      program_mode = MODE_EEPROM;
    } else if(argv[1][0] == 'f' || argv[1][0] == 'F') {
      program_mode = MODE_FLASH;
    } else {
      Serial.println("Unknown mode specified");
    }
  }
  Serial.print("Current mode is ");
  print_mode();
  Serial.println();
  return 0;
}

int cmd_reset(int argc, char **argv) {
  Serial.println("Resetting...");
  digitalWrite(ResetPin, LOW);
  delayMicroseconds(10);
  digitalWrite(ResetPin, HIGH);
  wait_for_ready();
  Serial.println("OK");
  return 0;
}

unsigned char fileBuf[4096];

int cmd_writeMulti(int argc, char **argv) {
  if(argc < 3) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int count = strtol(argv[2], NULL, 16);
  unsigned int actualBytesCount = Serial.readBytes(fileBuf, count);
  flash_cmd_unlock_bypass();
  for(int i = 0; i < actualBytesCount; i++) {
    flash_cmd_bypass_write_to(addr, fileBuf[i]);
    addr++;
  }
  flash_cmd_unlock_bypass_reset();
  while(Serial.available() > 0) {
    char k = Serial.read();
  }
  Serial.print("ACK");
  Serial.println(actualBytesCount);
  return 0;
}

int cmd_timeout(int argc, char **argv) {
  if(argc < 2) {
    return 0;
  }
  unsigned int timeout_milliseconds = strtol(argv[1], NULL, 10);
  Serial.setTimeout(timeout_milliseconds);
  return 0;
}

int cmd_readString(int argc, char **argv) {
  if(argc < 2) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int limit = 80;
  if(argc >= 3) {
    limit = strtol(argv[2], NULL, 16);
  }
  while(limit > 0) {
    limit --;
    set_address(addr);
    char letter = read_data();
    if(isprint(letter)) {
      Serial.print(letter);
    } else {
      limit = 0;
    }
    addr ++; 
  }
  Serial.println();
  return 0;
}

int cmd_version(int argc, char **argv) {
  Serial.println("GTCP2-0.0.1");
  return 0;
}
//Shell commands end

void setup() {
  // put your setup code here, to run once:

  //Set all pins on ports A and C to output
  //Doing this in setup() because they'll stay as outputs
  DDRC = 0xFF;
  DDRA = 0xFF;

  //Start the data port as input to avoid accidental contention
  DDRL = 0;

  digitalWrite(OutputEnablePin, HIGH);
  digitalWrite(WriteEnablePin, HIGH);
  digitalWrite(ResetPin, HIGH);
  digitalWrite(ClkPin, LOW);
  digitalWrite(SCKPin, LOW);
  digitalWrite(MOSIPin, LOW);
  digitalWrite(SSPin, HIGH);
  
  pinMode(OutputEnablePin, OUTPUT);
  pinMode(WriteEnablePin, OUTPUT);
  pinMode(ResetPin, OUTPUT);
  pinMode(ClkPin, OUTPUT);
  pinMode(IRQPin, INPUT_PULLUP);
  pinMode(ReadyPin, INPUT_PULLUP); //Ready is an open-drain output on the flash
  pinMode(SCKPin, OUTPUT);
  pinMode(MOSIPin, OUTPUT);
  pinMode(SSPin, OUTPUT);
  pinMode(MISOPin, INPUT);

  shift_bank(lastBankNum);

  Serial.begin(9600);
  Serial.println("Hello world");
  shell.attach(Serial);

  digitalWrite(ResetPin, LOW);
  delayMicroseconds(10);
  digitalWrite(ResetPin, HIGH);
  wait_for_ready();

  shell.addCommand(F("readAt"),cmd_readAt);
  shell.addCommand(F("eraseChip"),cmd_eraseChip);
  shell.addCommand(F("writeTo"),cmd_writeTo);
  shell.addCommand(F("shift"),cmd_shift);
  shell.addCommand(F("mode"),cmd_mode);
  shell.addCommand(F("reset"),cmd_reset);
  shell.addCommand(F("writeMulti"),cmd_writeMulti);
  shell.addCommand(F("timeout"),cmd_timeout);
  shell.addCommand(F("readString"),cmd_readString);
  shell.addCommand(F("version"),cmd_version);

  Serial.print("Starting in ");
  print_mode();
  Serial.println(" mode");
  Serial.println("Ready!");
}

void loop() {
  // put your main code here, to run repeatedly:
  shell.executeIfInput();
}
