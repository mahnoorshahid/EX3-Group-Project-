/*
Making a potentiometer with Bare Paint
Attach one wire from +5V to one side of a pad of Bare paint
Attach second wire from Ground to other side of same pad of paint
Wire connected to Analog Pin 0 acts as wiper
*/

int sensorValue = A0; // This is the wiper which moves along the pad of Bare Paint it is connected to Analog Pin 0
int ledPin = 9;// This is the LED which we will be dimming. It is connected to pin 9 and ground.

void setup()
{
Serial.begin(9600);

}
void loop()
{
sensorValue = analogRead(A0); // Read the value from the wiper
ledPin= map(sensorValue, 0, 1023, 0, 255); // map the value from the wiper (0-1023) to the range of the LED (0-255)
analogWrite(9, ledPin); // Change the brightness of the LED based on the remapped values received from the wiper

Serial.println(sensorValue); // print the values to the serial port
}
