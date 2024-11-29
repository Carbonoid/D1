
/*
  Illuminated D1 Logo
  
  Using a NeoPixel module to illumniate the Carbonoid D1 Logo Panel.
  
  Created by:  Alex Skoruppa
  Date:        May 10, 2019
  License:     GPLv3
*/
#include <Adafruit_NeoPixel.h>

#define PIN            2
#define NUMPIXELS      7
 
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
  
void setup() {
  pixels.begin();
  randomSeed(analogRead(0));
  Serial.begin(9600);
}

void set_all_pixels(byte r, byte g, byte b)
{    
  for(int i=0;i<NUMPIXELS;i++)
  {
    pixels.setPixelColor(i, pixels.Color(r, g, b)); // Moderately bright green color.
    pixels.show(); // This sends the updated pixel color to the hardware.
  }  
}

void turn_off_all_pixels()
{
  for(int i=0;i<NUMPIXELS;i++)
  {
    pixels.setPixelColor(i, pixels.Color(0,0,0)); // Moderately bright green color.
    pixels.show(); // This sends the updated pixel color to the hardware.
  } 
}

void dim_on_all_pixels(byte r, byte g, byte b, int delay_t)
{
  for(int i=0;i<255;i++)
  {
     set_all_pixels(r/255.*i,g/255.*i,b/255.*i);
     delay(delay_t); // Delay for a period of time (in milliseconds).
  }  
}

void dim_off_all_pixels(byte r, byte g, byte b, int delay_t)
{
  for(int i=255;i>-1;i--)
  {
     set_all_pixels(r/255.*i,g/255.*i,b/255.*i);
     delay(delay_t); // Delay for a period of time (in milliseconds).
  }  
}

void loop() {
 
  byte r = random(0, 255);
  byte g = random(0, 255);
  byte b = random(0, 255);
  
  /*String message = "R:"+ String(r) + " G:" + String(g) + " B:" + String(b);
  Serial.println(message);//*/

  int color_change_delay_ms = 15;
  
  dim_on_all_pixels(r,g,b,color_change_delay_ms);
  dim_off_all_pixels(r,g,b,color_change_delay_ms);
}
