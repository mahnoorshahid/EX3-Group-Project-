//https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
import processing.sound.*;

import processing.serial.*;
Serial myPort;

Drop[] drops = new Drop[300];

SoundFile file;
SoundFile file2;
String audioName = "rainsound.mp3";
String audioName2 = "thunder.mp3";
String path;
String path2;

int sensor1;
int sensor2;
int sensor3;
int x = 30;
int e = 7;

int square [];


float ySpeed = 100;
float sx = width/2;
float sy = 0;


void setup(){
  
 // println(Serial.list());
  printArray(Serial.list());
  //size(400,400);
  fullScreen();
  String portName = "/dev/cu.usbmodem14101";
  myPort = new Serial(this, portName, 9600);
   // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
  
      for (int i = 0; i < drops.length; i++) {
        drops[i] = new Drop();
      }

  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  
  if (sensor2 > x){
  file.play();
  }

  
  path2 = sketchPath(audioName2);
  file2 =  new SoundFile(this, path2);
  
 if (sensor3 > e){

  file2.play();
   
 }

}

void draw(){
  background(27);
  fill(255);

if (sensor3 > 700){
  
   path2 = sketchPath(audioName2);
  file2 =  new SoundFile(this, path2);
  file2.play();
  float xstep = 20;
  float ystep = 20;
  float lastx = 150;
  float lasty = random(-100,-10);
  float tx = random(0,500);
  float border = random(-100,-10);
  for (float ty=border; ty<=width-border; ty+=ystep)
  {
        xstep = random(50)-25;
        tx += xstep;
        stroke(255);
        strokeWeight(random(2,4));
        line(tx, ty, lastx, lasty);
        lastx = tx;
        lasty = ty;
   }
 }


if (sensor2 > x){
   for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
  
} 
else {
 // file.pause();
 // background(30);
}
  
  
}

void serialEvent(Serial myPort) {
  //yPos = myPort.read();//like serial.write in arduino
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
    sensor2 = sensors[1]; 
    sensor3 = sensors[2];

  }
}


class Drop {
  float x;
  float y;
  float z;
  float len;
  float yspeed;

  Drop() {
    x  = random(width);
    y  = random(-900, -50);
    z  = random(0, 20);
    len = map(z, 0, 20, 10, 20);
    yspeed  = map(z, 0, 20, 1, 20);

    yspeed = 1;

  }

  void fall() {
    y = y + yspeed;
   yspeed =  sensor1* 0.5;

    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-500, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(random(100,255), random(125,255), random(175,255));
  //  stroke(18, random(120,143), 236, random(100,255));
    line(x, y, x, y+len);
  }
}
