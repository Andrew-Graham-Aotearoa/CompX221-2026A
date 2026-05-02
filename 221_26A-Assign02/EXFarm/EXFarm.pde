//import library
import controlP5.*;
ControlP5 cp5;

//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;

//bacteriaLevel counter start point
int bacteriaLevel = 710;

//Marine Snow Density
float density = 5;

//ArrayList for TubeWorms
ArrayList<TubeWorm> tubeWormList;

//BlackSmoker Declaration
BlackSmoker b;

//HoffCrab ArrayList
ArrayList<HoffCrab> hoffCrabList;

// Background and Gradient variables
color top = color(9, 92, 142); // Mid Blue
color bottom = color(14, 48, 72); // Deep Blue
//Gradient area is defined outside of the UI area.
//Simulation Area
int hSim = 600;
int wSim = 1072;
int simX= 213;
int simY = 128;


//
//**********************************************SETUP*********************************************************
//
void setup()
{
  size(1280, 720);

  //Add cp5 to Sketch
  cp5 = new ControlP5(this);

  // add BlackSmoker slider
  cp5.addSlider("smokerSize")
    .setLabel("Black Smoker Temperature")
    .setPosition(850, 25)
    .setSize(315, 25)
    .setRange(150, 452)
    .setValue(90)
    ;
  // Label for BlackSmoker slider
  cp5.getController("smokerSize").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("smokerSize").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  // add SnowDensity slider
  cp5.addSlider("snowDensity")
    .setLabel("Marine Snow Density")
    .setPosition(850, 75)
    .setSize(315, 25)
    .setRange(1, 10)
    .setValue(2)
    ;
  // Label for SnowDensity slider
  cp5.getController("snowDensity").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("snowDensity").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

//
//******************************************Organisms*******************************************************************
//
  //Black Smoker object
  b = new BlackSmoker(700, 720);

  //Seed HoffCrabs
  hoffCrabList = new ArrayList<HoffCrab>();
  //Hoff Crabs to Start
  for (int i = 0; i < 5; i++)
  {
    hoffCrabList.add
      (new HoffCrab((int)random(213, 1270), (int)random(677, 698)));
  }

  //Seed MarineSnow
  marineSnowList = new ArrayList<MarineSnow>();

  //Seed TubeWorms
  tubeWormList = new ArrayList<TubeWorm>();
  //tubeworm objects to start
  for (int i = 0; i < 10; i++)
  {
    tubeWormList.add
      (new TubeWorm((int)random(700- b.getHeatRadius(), 700+ b.getHeatRadius()), (int)random(660, 700)));
  }
}

//
//******************************************DRAW***********************************************************
//
void draw()
{

  setGradient(simX, simY, wSim, hSim, top, bottom);

  //border around Gradient + Simulation Area
  noFill();
  stroke(#000000);
  strokeWeight(5);
  rect( simX, simY, wSim, hSim );

  //Header and TopBar Title
  int marginLeft = 36;
  fill(#000000);
  PFont h1;
  h1 = loadFont("Chicago12.1-48.vlw");
  textFont(h1, 62);
  text("EXTREMOPHILE FARM", marginLeft, 74);
}

//Background Gradient
void setGradient(int x, int y, float w, float h, color cTop, color cBm) {
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(cTop, cBm, inter);
    stroke(c);
    line(x, i, x+w, i);
  }

  //BlackSmoker / Draw
  b.drawObject();
  //display temp
  println("Temp at Mouse is:"+ " " + b.getTempAt(new PVector(mouseX, mouseY)));

  //MarineSnow Seeding
  if (frameCount %(int)(60/ density) == 0)
  {
    marineSnowList.add
      (new MarineSnow((int)random(225, 1270), (int)random(50, 10-height)));
  }

  for (int i = marineSnowList.size()-1; i >=0; i--)
  {
    marineSnowList.get(i).drawObject();
    marineSnowList.get(i).moveObject();

//debugging marine snow to Bacteria change
    //if (marineSnowList.get(i).isSnow() == false)
    //{
    //  println("Bacteria Created" + " " +
    //    (int)marineSnowList.get(i).getPosition().y + " " +
    //    (int)marineSnowList.get(i).getPosition().x);
    //}
  }

  //Simulation End Condition
  if (bacteriaLevel <= 235)
  {
    fill(#dc143c);
    textSize(80);
    text("Bacteria Overpopulation!", width/4, height/2);
    noLoop();
  }


  //Tubeworm Display
  for (int i = tubeWormList.size()-1; i >=0; i--)
  {
    tubeWormList.get(i).drawObject();
    tubeWormList.get(i).eatSnow();
    tubeWormList.get(i).update();
    if (tubeWormList.get(i).isAlive() == false)
    {
      tubeWormList.remove(i);
    }
  }

  //Hoff Crab Display
  for (int i = hoffCrabList.size()-1; i >=0; i--)
  {
    hoffCrabList.get(i).drawObject();
    hoffCrabList.get(i).eatBacteria();
    hoffCrabList.get(i).moveObject();
    hoffCrabList.get(i).update();
    if (hoffCrabList.get(i).isAlive() == false)
    {
      hoffCrabList.remove(i);
    }
  }
  //User Interface area (top and Sidebar)
  noStroke();
  fill(#095c8e);
  rect(0, 0, width, 128);
  rect(0, 128, 213, 600);

  //bacteriaLevel Visual Display
  fill(#39ff14);
  rect(180, bacteriaLevel - 20, 20, 710 - bacteriaLevel);

  //display mouse position
  println("Mouse position: " + mouseX + ", " + mouseY);
  
  
}

//callback for Black Smoker Controls
void smokerSize(float size)
{
  b.setSize(size);
}

//callback for MarineSnow Controls
void snowDensity(float amount)
{
  density = (int)amount;
}
