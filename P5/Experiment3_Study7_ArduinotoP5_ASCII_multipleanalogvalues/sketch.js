/*
   DIGF 2004 Atelier 1
   Kate Hartman
   Experiment 3 - Study 7
   Arduino to P5.js - sending value for (3) sensors
   Based on based on the Serial Input to P5.js Lab on the ITP Physical Computing site: 
   https://itp.nyu.edu/physcomp/labs/labs-serial-communication/lab-serial-input-to-the-p5-js-ide/
   */


  var serial; // variable to hold an instance of the serialport library
  var portName = '/dev/cu.usbmodem14101';  // fill in your serial
  var inData;                             // for incoming serial
  var sensor1;
  var sensor2;
  var sensor3;
  var mappedSensor1;
  var mappedSensor2;
  var mappedSensor3;
 

function setup() {
	createCanvas(800, 300);
  background(255);
  console.log(mappedSensor1);

  serial = new p5.SerialPort(); // make a new instance of the serialport library
  serial.on('list', printList); // set a callback function for the serialport list event
  serial.on('connected', serverConnected); // callback for connecting to the server
  serial.on('open', portOpen);        // callback for the port opening
  serial.on('data', serialEvent);     // callback for when new data arrives
  serial.on('error', serialError);    // callback for errors
  serial.on('close', portClose);      // callback for the port closing
 
 serial.list(); // list the serial ports
 serial.open(portName);              // open a serial port
console.log(sensor1);

		
}

function draw() {
  background(55);
    var square = [];
  var ySpeed = 100;
   var sx = width/2;
   var sy = 0;
	noStroke();
    if(sensor1 >  40){
      fill(200, 100, 200); 
    //}else{
     //fill(255, 0, 90);
    }
  
  ellipse(width/2, mappedSensor1, 10, 10);
   fill(255);

  rect(width/3, sy - mappedSensor1, 3, 35);
  fill(0,200,200);
   rect (sx, sy, 3, 25);
   sy +=ySpeed;
   sy -= mappedSensor1;
  // ySpeed -=mappedSensor1;
   
   //rect(width/2, 0, 3, random(5, 35));


   //ellipse(width/2, height/2, 10, 10);

		for (i = 0; i < square.length; i++){
         fill(155, 0, 240);
	     rect(square[i].x, square[i].y, 3, random(5,35));
     
         //point(square[i].x, square[i].y += 3);
 
			square[i].y = square[i].y + square[i].dy;
			
			//square[i].fillColor();
			square[i].fillColor2;
			square[i].move();
      
			if (square[i].y > height){ 
				square[i].y = random(-100)

			};
	
		}

}

 
 function serverConnected() {
  console.log('connected to server.');
}
 
function portOpen() {
  console.log('the serial port opened.')
}

function serialEvent() {
  // read a string from the serial port
  // until you get carriage return and newline:
  var inString = serial.readStringUntil('\r\n');
 
  //check to see that there's actually a string there:
  if (inString.length > 0 ) {
    var sensors = split(inString, ',');            // split the string on the commas
    if (sensors.length > 0) {                      // if there are three elements
      sensor1 = sensors[0];  

      mappedSensor1 = map(sensor1, 0, 1023, height, 0);

    }
  }
}
 
function serialError(err) {
  console.log('Something went wrong with the serial port. ' + err);
}
 
function portClose() {
  console.log('The serial port closed.');
}


// get the list of ports:
function printList(portList) {
 // portList is an array of serial port names
 for (var i = 0; i < portList.length; i++) {
 // Display the list the console:
 console.log(i + " " + portList[i]);
 }
}


function Square(){
			
			this.x = random(width);
			this.y = height;
			this.dy = random(1,5);
			this.dy = 10;
			this.dx = random (0);
      		

          this.fillColor = 

				fill(255,90,90,100);

		this.move = function(){

			this.y += this.dy;
		}

			

			
		}
