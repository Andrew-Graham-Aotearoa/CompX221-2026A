import controlP5.*;

ControlP5 cp5;

int sliderValue = 90;


void setup() {
  size(1280,720);
  noStroke();
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(3,452)
     ;
  
  
  

}

void draw() {
  background(255);

  fill(sliderValue);
  rect(0,0,width,height);
  
}
