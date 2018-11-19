/*
  AnalogReadSerial

  Reads an analog input on pin 0, prints the result to the Serial Monitor.
  Graphical representation is available using Serial Plotter (Tools > Serial Plotter menu).
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/AnalogReadSerial
*/

// Analog output pin that the LED is attached to

//int sensorValue = 0;        // value read from the pot
int outputValue = 0; 
int led = A2;
int sensorValue = analogRead(A0);
//int sensorValue = analogRead(A3);
//int sensorValue = analogRead(A4);
// the setup routine runs once when you press reset:
void setup() {

 
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  
  
 analogRead(led);
 //analogWrite(led);
 pinMode(sensorValue, INPUT);
 pinMode (led, OUTPUT);

}

// the loop routine runs over and over again forever:

void loop() {
  // read the input on analog pin 0:
  
 sensorValue = analogRead(A0);
  outputValue = map(sensorValue, 0, 1023, 0, 220);
  //analogWrite()
  //analogWrite(led);
  analogWrite(led, outputValue);
  // print out the value you read:
 Serial.println(sensorValue);
  Serial.print(",");
 // Serial.println(outputValue);
   //Serial.println(led);
  delay(61);        // delay in between reads for stability
}
