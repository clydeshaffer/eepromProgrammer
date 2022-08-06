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
#include <CRC32.h>

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

void set_long_address(unsigned long x) {
  if ((x >> 14) & 0x7F != lastBankNum) {
    shift_bank((x >> 14) & 0x7F);
  }
  set_address(x & 0x3FFF);
}

void wait_for_ready() {
  while (digitalRead(ReadyPin) == LOW) {
  }
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
  if (program_mode == MODE_EEPROM) {
    delayMicroseconds(1);
  }
  digitalWrite(WriteEnablePin, LOW);
  if (program_mode == MODE_EEPROM) {
    delayMicroseconds(1);
  }
  digitalWrite(WriteEnablePin, HIGH);
  if (program_mode == MODE_EEPROM) {
    delayMicroseconds(1);
  }
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

void flash_cmd_sector_erase(unsigned char sa) {
  shift_bank(sa >> 1);
  flash_cmd_unlock();
  write_to(0xAAA, 0x80);
  flash_cmd_unlock();
  write_to((sa & 1) << 13, 0x30);
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
  if (program_mode == MODE_EEPROM) {
    Serial.print("EEPROM");
  } else if (program_mode == MODE_FLASH) {
    Serial.print("FLASH");
  } else {
    Serial.print("UNDEFINED");
  }
}

//Shell commands start
int cmd_readAt(int argc, char **argv) {
  if (argc < 2) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  set_address(addr);
  Serial.println(read_data(), HEX);
  return 0;
}

int cmd_dump(int argc, char **argv) {
  if (argc < 3) {
    return 0;
  }
  unsigned long full_address = strtol(argv[1], NULL, 16);
  unsigned long full_span = strtol(argv[2], NULL, 16);
  for (unsigned long il = 0; il < full_span; il++) {
    set_long_address(full_address + il);
    Serial.write(read_data());
  }
  Serial.end();
  return 0;
}

int cmd_eraseChip(int argc, char **argv) {
  Serial.println("Starting chip erase...");
  flash_cmd_chip_erase();
  wait_for_ready();
  Serial.println("Done");
  return 0;
}

int cmd_eraseSector(int argc, char **argv) {
  if (argc < 2) {
    return 0;
  }
  unsigned char sector_addr = strtol(argv[1], NULL, 16);
  Serial.print("Erasing sector $");
  Serial.println(sector_addr, HEX);
  flash_cmd_sector_erase(sector_addr);
  wait_for_ready();
  Serial.println("Done");
}

int cmd_writeTo(int argc, char **argv) {
  if (argc < 3) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int data = strtol(argv[2], NULL, 16);
  if (program_mode == MODE_FLASH) {
    Serial.print("Writing $");
    Serial.print((unsigned char) data, HEX);
    Serial.print(" to $");
    Serial.println(addr, HEX);
    flash_cmd_program_to(addr, (unsigned char) data);
    wait_for_ready();
    Serial.println("Done");
    return 0;
  } else {
    write_to(addr, (unsigned char) data);
    return 0;
  }
}

int cmd_shift(int argc, char **argv) {
  if (argc < 2) {
    return 0;
  }
  unsigned char addr = strtol(argv[1], NULL, 16);
  shift_bank(addr);
  return 0;
}

int cmd_mode(int argc, char **argv) {
  if (argc > 1) {
    if (argv[1][0] == 'e' || argv[1][0] == 'E') {
      program_mode = MODE_EEPROM;
    } else if (argv[1][0] == 'f' || argv[1][0] == 'F') {
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
  if (argc < 3) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int count = strtol(argv[2], NULL, 16);
  unsigned int actualBytesCount = Serial.readBytes(fileBuf, count);
  if (program_mode == MODE_FLASH) {
    flash_cmd_unlock_bypass();
    for (int i = 0; i < actualBytesCount; i++) {
      flash_cmd_bypass_write_to(addr, fileBuf[i]);
      addr++;
    }
    flash_cmd_unlock_bypass_reset();
  } else {
    for (int i = 0; i < actualBytesCount; i++) {
      write_to(addr, fileBuf[i]);
      while (read_data() != fileBuf[i]) {
        write_to(addr, fileBuf[i]);
        delay(1);
      }
      addr++;
      delay(1);
      wait_for_ready();
    }
  }
  while (Serial.available() > 0) {
    char k = Serial.read();
  }
  Serial.print("ACK");
  Serial.println(actualBytesCount);
  return 0;
}

CRC32 crc;
int cmd_checksum(int argc, char **argv) {
  if (argc < 3) {
    return 0;
  }
  unsigned long addr = strtol(argv[1], NULL, 16);
  unsigned long count = strtol(argv[2], NULL, 16);
  crc.reset();
  for (unsigned long i = 0; i < count; i++) {
    set_long_address(addr);
    crc.update(read_data());
    addr++;
  }
  Serial.print("CRC32: ");
  Serial.println(crc.finalize(), HEX);
}

int cmd_timeout(int argc, char **argv) {
  if (argc < 2) {
    return 0;
  }
  unsigned int timeout_milliseconds = strtol(argv[1], NULL, 10);
  Serial.setTimeout(timeout_milliseconds);
  return 0;
}

int cmd_readString(int argc, char **argv) {
  if (argc < 2) {
    return 0;
  }
  unsigned int addr = strtol(argv[1], NULL, 16);
  unsigned int limit = 80;
  if (argc >= 3) {
    limit = strtol(argv[2], NULL, 16);
  }
  while (limit > 0) {
    limit --;
    set_address(addr);
    char letter = read_data();
    if (isprint(letter)) {
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
  Serial.println("GTCP2-0.0.2");
  return 0;
}

bool user_confirm() {
  char c;
  while(1) {
    while(Serial.available() == 0) {}
    char c = Serial.read();
    while(Serial.available() > 0) {
      Serial.read();
    }
    if(c == 'y') {
      return true;
    }
    if(c == 'n') {
      return false;
    }
    
    if(c == '\r') {
      Serial.println("Please enter 'y' or 'n'");
    }
  }
}

#define EXPECT(x) if(!(x)){Serial.println("FAIL");return -1;}
//Run test suite for newly assembled flash carts
int cmd_test(int argc, char **argv) {
  Serial.println("Test suite for newly assembled flash boards!");
  Serial.println("This will erase any stored data. Are you sure you wish to continue? (y/n)");
  if(!user_confirm()) {
    Serial.println("Test canceled.");
    return 0;
  }
  Serial.println("Starting tests...");
  Serial.println();
  shift_bank(0);
  //Chip Erase test
  Serial.print("\tChip erase: ");
  float readyTime = 0;
  flash_cmd_chip_erase();
  EXPECT(digitalRead(ReadyPin)==LOW)
  while(digitalRead(ReadyPin)==LOW){
    delay(100);
    readyTime += 0.1f;
    EXPECT(readyTime<20)
  }
  EXPECT(readyTime>1)
  set_address(0x0000);
  EXPECT(read_data()==0xFF)
  set_address(0xFFFF);
  EXPECT(read_data()==0xFF)
  set_address(0xCAFE);
  EXPECT(read_data()==0xFF)
  Serial.println("PASS");

  //Write/read test
  Serial.print("\tWrite/read: ");
  flash_cmd_program_to(0x0000, 0x55);
  set_address(0x0000);
  EXPECT(read_data()==0x55)
  flash_cmd_program_to(0x1000, 0x00);
  set_address(0x1000);
  EXPECT(read_data()==0x00)
  Serial.println("PASS");

  Serial.print("\tShift register: ");
  shift_bank(1);
  set_address(0x0000);
  EXPECT(read_data()==0xFF)
  flash_cmd_program_to(0x0000, 0xAA);
  set_address(0x0000);
  EXPECT(read_data()==0xAA)
  set_address(0xC000);
  EXPECT(read_data()==0xFF)
  shift_bank(0x7F);
  set_address(0x0000);
  EXPECT(read_data()==0xFF)
  flash_cmd_program_to(0x0000, 0x00);
  set_address(0x0000);
  EXPECT(read_data()==0x00)
  set_address(0xC000);
  EXPECT(read_data()==0x00)
  Serial.println("PASS");
  
  Serial.println();
  Serial.println("All tests passed.");
  Serial.println("Cleaning up with one last chip erase...");
  flash_cmd_chip_erase();
  wait_for_ready();
  while(Serial.available() > 0) {
    Serial.read();
  }
  Serial.println("Done!");
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

  Serial.begin(115200);
  Serial.println("Hello world");
  shell.attach(Serial);

  digitalWrite(ResetPin, LOW);
  delayMicroseconds(10);
  digitalWrite(ResetPin, HIGH);
  wait_for_ready();

  shell.addCommand(F("readAt"), cmd_readAt);
  shell.addCommand(F("dump"), cmd_dump);
  shell.addCommand(F("eraseChip"), cmd_eraseChip);
  shell.addCommand(F("eraseSector"), cmd_eraseSector);
  shell.addCommand(F("writeTo"), cmd_writeTo);
  shell.addCommand(F("shift"), cmd_shift);
  shell.addCommand(F("mode"), cmd_mode);
  shell.addCommand(F("reset"), cmd_reset);
  shell.addCommand(F("writeMulti"), cmd_writeMulti);
  shell.addCommand(F("checksum"), cmd_checksum);
  shell.addCommand(F("timeout"), cmd_timeout);
  shell.addCommand(F("readString"), cmd_readString);
  shell.addCommand(F("version"), cmd_version);
  shell.addCommand(F("test"), cmd_test);
  Serial.print("Starting in ");
  print_mode();
  Serial.println(" mode");
  Serial.println("Ready!");
}

void loop() {
  // put your main code here, to run repeatedly:
  shell.executeIfInput();
}
