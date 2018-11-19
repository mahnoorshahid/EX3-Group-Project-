import processing.serial.*;
Serial myPort;
int yPos;
int sensor1;

int square [];
float mappedSensor1;
float ySpeed = 100;
float sx = width/2;
float sy = 0;
void setup(){
  frameRate(41);
  println(Serial.list());
   //printArray(Serial.list());
  size(255, 255);
  String portName = "/dev/cu.usbmodem14101";
  myPort = new Serial(this, portName, 9600);
   // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');


}

void draw(){
  background(0);
  fill(255);
 // ellipse(width/2, mappedSensor1, 20, 20);
  yPos = sensor1;

    if (sensor1 > 30) {
    fill(57, 30, 20);
    yPos = yPos*-1;
  } else {
    fill(255);
     yPos = yPos*1;
  }
    ellipse (width/2, height/2 + yPos, 10, 10);
    fill(240, 90);
    
    rect(0, height, width/3 ,-mappedSensor1);

 fill(0,200,200);
 rect(width/3, sy - mappedSensor1, 3, 35);
  sy +=ySpeed;
   sy -= mappedSensor1;
    ellipse(width/2, mappedSensor1, 10, 10);
ySpeed = mappedSensor1;
}

void serialEvent(Serial myPort) {
  yPos = myPort.read();//like serial.write in arduino
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    // println(myString);
    myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
   println();
    sensor1 = sensors[0];  
    mappedSensor1 = map(sensor1, 0, 1023, height, 0);
  }
}
