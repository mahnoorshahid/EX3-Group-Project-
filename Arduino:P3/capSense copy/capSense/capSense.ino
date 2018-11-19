

#include <CapacitiveSensor.h>

/*
 * https://www.instructables.com/id/Arduino-Capacitive-Sensor-in-Less-Than-2-Minutes/
 * https://forum.arduino.cc/index.php?topic=188022.0
 * CapitiveSense Library Demo Sketch
 * Paul Badger 2008
 * Uses a high value resistor e.g. 10M between send pin and receive pin
 * Resistor effects sensitivity, experiment with values, 50K - 50M. Larger resistor values yield larger sensor values.
 * Receive pin is the sensor pin - try different amounts of foil/metal on this pin
 */


CapacitiveSensor   cs_4_2 = CapacitiveSensor(4,2);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired

int sensorValue = analogRead(A0);
int pressure = analogRead(A2);
int outputValue = 0;
void setup()                    
{
   cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(9600);

   //pinMode(sensorValue,INPUT);
  // pinMode(pressure, INPUT);
}//share learnings, findings
//three related works that contextualize the work that you are doing. 

void loop()                    
{
    //long start = millis();
    long total1 =  cs_4_2.capacitiveSensor(10);
    //outputValue = map (sensorValue, 0, 1023, 0, 255);
 
    //analogWrite(sensorValue, outputValue);
   // if (total1 >=1){
    //  analogWrite(sensorValue, outputValue);
    // }
                   // tab character for debug windown spacing
    sensorValue = analogRead(A0);
    pressure = analogRead(A2);
    Serial.print(total1);                  // print sensor output 1
    //Serial.println("\t");
    Serial.print(",");
    Serial.print(sensorValue);
    Serial.print(",");
    Serial.println(pressure);
    delay(80);                             // arbitrary delay to limit data to serial port 
}
