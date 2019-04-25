#define ADDR_SHIFT_CLK 4
#define ADDR_SERIAL_OUT 13
#define WRITE_ENABLE 2
#define OUTPUT_ENABLE 5

int ioPinsBitOrder[] = {3, 6, 7, 12, 11, 10, 9, 8};

int addr_bit_order[] = {4, 5, 6, 7,13,14,15,12, 11,10, 8, 9, 0, 1, 2, 3};

int address = 0;

void set_write_mode() {
  digitalWrite(OUTPUT_ENABLE, HIGH);
  data_pins_mode(OUTPUT);
}

void set_read_mode() {
  data_pins_mode(INPUT);
  digitalWrite(OUTPUT_ENABLE, LOW);
}

void data_pins_mode(int mode) {
  for(int i = 0; i < 8; i++) {
    pinMode(ioPinsBitOrder[i], mode);
  }
}

void shift_data_out(byte num) {
  for(int i = 0; i < 8; i++)
  {
    if((num & (1 << i)) != 0) {
      digitalWrite(ioPinsBitOrder[i], HIGH);
    } else {
      digitalWrite(ioPinsBitOrder[i], LOW);
    }
  }
}

byte get_data() {
  int returnByte = 0;
  for(int i = 0; i < 8; i++)
  {
    returnByte |= digitalRead(ioPinsBitOrder[i]) << i;
  }
  return returnByte;
}

void shift_address_out(int addr) {
  byte highByte = 0, lowByte = 0;
  int i = 0;
  for(i = 0; i < 8; i++)
  {
    if((addr & (1 << addr_bit_order[i])) != 0) {
      lowByte |= 1 << i;
    }
  }
  for(i = 8; i < 16; i++)
  {
    if((addr & (1 << addr_bit_order[i])) != 0) {
      highByte |= 1 << (i - 8);
    }
  }
  digitalWrite(ADDR_SHIFT_CLK, LOW);
  delayMicroseconds(1);
  shiftOut(ADDR_SERIAL_OUT, ADDR_SHIFT_CLK, MSBFIRST, highByte);
  digitalWrite(ADDR_SHIFT_CLK, LOW);
  shiftOut(ADDR_SERIAL_OUT, ADDR_SHIFT_CLK, MSBFIRST, lowByte);
}

void write_to_chip(byte num) {
  digitalWrite(WRITE_ENABLE, HIGH);
  digitalWrite(OUTPUT_ENABLE, HIGH);
  delayMicroseconds(10);
  shift_data_out(num);
  delay(1);
  digitalWrite(WRITE_ENABLE, LOW);
  delayMicroseconds(1);
  digitalWrite(WRITE_ENABLE, HIGH);
  delayMicroseconds(200);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(ADDR_SHIFT_CLK, OUTPUT);
  pinMode(ADDR_SERIAL_OUT, OUTPUT);
  pinMode(WRITE_ENABLE, OUTPUT);
  pinMode(OUTPUT_ENABLE, OUTPUT);
  set_write_mode();
  digitalWrite(WRITE_ENABLE, HIGH);
  digitalWrite(OUTPUT_ENABLE, HIGH);
  address = 57344;
  Serial.println("READY");
  
  /*delay(10);
  shift_address_out(0x0000);
  delay(1);
  write_to_chip(0xAA);
  delay(5);
  shift_address_out(0x0001);
  delay(1);
  write_to_chip(0x55);
  delay(5);
  shift_address_out(0x0002);
  delay(1);
  write_to_chip(0xF0);
  delay(5);
  shift_address_out(0x0003);
  delay(1);
  write_to_chip(0x0F);
  delay(5);
  Serial.println("done");*/
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 1) {
    byte serialBuf[32];
    char hexBuf[3];
    int bytesToWrite = Serial.parseInt();
    Serial.read();
    if(bytesToWrite > 32) bytesToWrite = 32;
    if(bytesToWrite > 0) {
      set_write_mode();
      Serial.print("Expecting "); Serial.print(bytesToWrite, DEC); Serial.println(" bytes.");
      while(Serial.available() < bytesToWrite) {}
      
      Serial.readBytes(serialBuf, bytesToWrite);
      Serial.print("Received ");
      Serial.println(bytesToWrite, DEC);
      for(int i = 0; i < bytesToWrite; i++) {
        sprintf(hexBuf, "%02X", serialBuf[i]);
        Serial.print(hexBuf[0]);
        Serial.print(hexBuf[1]);
        shift_address_out(address);
        delay(3);
        write_to_chip(serialBuf[i]);
        delay(5);
        address++;
      }
      Serial.println();
    } else {
      //reading mode
      int bytesToRead = Serial.parseInt();
      Serial.read();
      if(bytesToRead > 0) {
        set_read_mode();
        for(int i = 0; i < bytesToRead; i++) {
          byte currentByte = get_data();
          address++;
          shift_address_out(address);
          sprintf(hexBuf, "%02X", currentByte);
          Serial.print(hexBuf[0]);
          Serial.print(hexBuf[1]);
        }
        Serial.println();
      } else {
        int addressToSet = Serial.parseInt();
        Serial.read();
        if(addressToSet < 0) addressToSet = 0;
        if(addressToSet >= 8192) addressToSet = 8191;
        address = addressToSet;
        shift_address_out(address);
        Serial.print("Set new address: ");
        Serial.println(address, HEX);
      }
    }
    Serial.println("READY");
  }
  /*int x;
  if(Serial.available() > 1) {
    x = Serial.parseInt();
    shift_address_out(x);
    Serial.println(x);
  }*/
}
