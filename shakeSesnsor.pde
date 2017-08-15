/*
based on AnalogReadSerial
Reads an analog input on pin 0, prints the result to the serial monitor.
Graphical representation is available using serial plotter (Tools &gt; Serial Plotter menu)
Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

This example code is in the public domain.

Becca's edits: trying to make a "shake sensor". I was looking at the frequency of when metal balls connected to
a circuit collided, and made this small bit of code to process it.
*/


int oldSensorVal = 0;
int LED = 4; // output
int highPoint = 25; // top or range i.e. highest frequence of collision
int lowPoint = -25; // bottom of range i.e. lowest frequency of collision

// the setup routine runs once when you press reset:
void setup() {
// initialize serial communication at 9600 bits per second:
Serial.begin(9600);
pinMode(LED, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
// read the input on analog pin 0:
int sensorValue = analogRead(A0);

// get the difernce between the two points on the graph
int diff = sensorValue - oldSensorVal;

if (diff &gt;= highPoint || diff &lt;= lowPoint) { // when the difference between the current shake, and the last shake is in range
digitalWrite(LED, LOW);
Serial.println("the light is OFF because you are shakey shakey. DIFF = ", diff);
delay(100);
}
else {
digitalWrite(LED, HIGH);
Serial.println("the light is ON because you are NOT shakey shakey. DIFF = ", diff );
}

oldSensorVal = sensorValue; // set new old sensor value for next loop

delay(100);

}
