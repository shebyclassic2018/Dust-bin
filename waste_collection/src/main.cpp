

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include "ArduinoJson.h"
#include "stdlib.h"
#include "string"

// const char* ssid = "captain";
// const char* password = "87654321";

const char* ssid = "captain";
const char* password = "12345678";
String ServerIP = "http://192.168.137.1/";

//Your Domain name with URL path or IP address with path
int trigPin = 4;    // Trigger
int echoPin = 13;    // Echo
long duration, cm, inches;
int binID = 1;
int blue = 5;
int red = 12;


;

void setup() {
  Serial.begin(115200); 
  
 pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(1000);
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
 }

void loop() {
    // The sensor is triggered by a HIGH pulse of 10 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
 
  // Read the signal from the sensor: a HIGH pulse whose
  // duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);
 
  // Convert the time into a distance
  cm = (duration/2) / 29.1;     // Divide by 29.1 or multiply by 0.0343
  inches = (duration/2) / 74;   // Divide by 74 or multiply by 0.0135
  
  Serial.print(inches);
  Serial.print("in, ");
  Serial.print(cm);
  Serial.print("cm");
  Serial.println();

  if (cm >= 20) {
    digitalWrite(blue, HIGH);
    digitalWrite(red, LOW);                                                                                                                      
  } else {                                                                                                                      
    digitalWrite(blue, LOW);
    digitalWrite(red, HIGH);
  }

    if(WiFi.status() == WL_CONNECTED){
      WiFiClient client;
      HTTPClient http;
      
      // Your Domain name with URL path or IP address with path
      String server = ServerIP + "/captein/php/set-level.php";
      http.begin(client, server.c_str());
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      String postedData = "level="+String(cm)+"&bin_id="+String(binID);
    

      // Send HTTP GET request
      int httpResponseCode = http.POST(postedData);
      
      if (httpResponseCode>0) {
        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);
        String payload = http.getString();
        String hello = "Hello Captein";
        // Serial.println(payload);
        if (strcmp(payload.c_str(), hello.c_str()) == 0) {
          Serial.println("Match");
        } else {
          Serial.println("Not Match");
        }

        delay(1000);
      }
      else {
        Serial.print("Error code: ");
        Serial.println(httpResponseCode);
      }
      // Free resources
      http.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }
}
