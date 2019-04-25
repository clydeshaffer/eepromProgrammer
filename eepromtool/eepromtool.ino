#define ADDR_SHIFT_CLK 2
#define DATA_SERIAL_OUT 4
#define ADDR_SERIAL_OUT 10
#define DATA_SHIFT_CLR 8
#define DATA_SHIFT_CLK 9
#define WRITE_ENABLE 7
#define OUTPUT_ENABLE 12
#define DATA_SHIFT_ENABLE 3

int addr_bit_order[] = {10, 0,0,0, 7, 6, 5, 4, 12, 8, 9, 11, 3, 2, 1, 0};
int data_bit_order[] = {4, 5, 6, 7, 0, 1, 2, 3 };

int address = 0;

void shift_data_out(byte num) {
  byte outboundData = 0;
  int i = 0;
  for(i = 0; i < 8; i++)
  {
    if((num & (1 << data_bit_order[i])) != 0) {
      outboundData |= 1 << i;
    }
  }
  digitalWrite(DATA_SHIFT_CLK, LOW);
  shiftOut(DATA_SERIAL_OUT, DATA_SHIFT_CLK, MSBFIRST, outboundData);
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
  pinMode(DATA_SHIFT_CLK, OUTPUT);
  pinMode(ADDR_SERIAL_OUT, OUTPUT);
  pinMode(DATA_SERIAL_OUT, OUTPUT);
  pinMode(DATA_SHIFT_CLR, INPUT);
  pinMode(WRITE_ENABLE, OUTPUT);
  pinMode(OUTPUT_ENABLE, OUTPUT);
  pinMode(DATA_SHIFT_ENABLE, OUTPUT);
  digitalWrite(DATA_SHIFT_ENABLE, HIGH);
  digitalWrite(DATA_SHIFT_CLR, HIGH);
  digitalWrite(WRITE_ENABLE, HIGH);
  digitalWrite(OUTPUT_ENABLE, HIGH);
  address = 0;
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
    int bytesToRead = Serial.parseInt();
    Serial.read();
    //if(bytesToRead > 32) bytesToRead = 32;
    Serial.print("Expecting "); Serial.print(bytesToRead, DEC); Serial.println(" bytes.");
    while(Serial.available() < bytesToRead) {}
    
    Serial.readBytes(serialBuf, bytesToRead);
    Serial.print("Received ");
    Serial.println(bytesToRead, DEC);
    for(int i = 0; i < bytesToRead; i++) {
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
    Serial.println("READY");
  }
}
