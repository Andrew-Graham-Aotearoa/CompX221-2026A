import controlP5.*;

ControlP5 cp5;
int myColor = color(#ff4500);



void setup() {
  size(1208,720);
  //noStroke();

  
  //Add cp5 to Sketch Setup
  cp5 = new ControlP5(this);
  

  // add custom slider
  cp5.addSlider("smokerSize")
     .setPosition(800,25)
     .setSize(315,25)
     .setRange(2,452)
     .setValue(90)
     ;
  
  // reposition the Label for controller 'slider'
  cp5.getController("smokerSize").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("smokerSize").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
   

}

void draw() {
  background(0);

  
  //adjustment parameters
  fill(myColor);
  rect(0,0,width,height);
  
}

//Callback to CP5
void smokerSize(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}
