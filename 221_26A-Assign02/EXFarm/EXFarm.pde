//import library
import controlP5.*;
ControlP5 cp5;

//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;

//bacteriaLevel counter start point
int bacteriaLevel;

//Marine Snow Density
float density;

//ArrayList for TubeWorms
ArrayList<TubeWorm> tubeWormList;
//TubeWorm Spawn Quantity
int tubeWormSpawn = 10;

//BlackSmoker Declaration
BlackSmoker b;

//HoffCrab ArrayList
ArrayList<HoffCrab> hoffCrabList;
//Hoff Crab Spawn Quantity
int hoffSpawn = 20;

// Background and Gradient variables
color top = color(9, 92, 142); // Mid Blue
color bottom = color(14, 48, 72); // Deep Blue
//Gradient area is defined outside of the UI area.
//Simulation Area
int hSim = 600;
int wSim = 1072;
int simX= 213;
int simY = 128;

//Pause Button
Boolean isPaused = false;

//Speed Control Radio Selection
RadioButton r;

//
//**********************************************UX SETUP*********************************************************
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

  //Pause Button
  cp5.addButton("pause")
    .setPosition(25, 650)
    .setSize(150, 25)
    ;

  //Reset Button
  cp5.addButton("reset")
    .setPosition(25, 680)
    .setSize(150, 25)
    ;


  //Radio Button
  r = cp5.addRadioButton("speedControl")
    .setPosition(25, 550)
    .setSize(25, 25)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(1)
    .setSpacingColumn(50)
    .addItem("0.5x", 0)
    .addItem("1x", 1)
    .addItem("2x", 2)
    .activate("1x")
    ;

  //
  //******************************************Organisms*(Setup)**********************************************************
  //
  //Black Smoker object
  b = new BlackSmoker(700, 720);

  //Seed HoffCrabs
  hoffCrabList = new ArrayList<HoffCrab>();
  //Hoff Crabs to Start
  for (int i = 0; i < hoffSpawn; i++)
  {
    hoffCrabList.add
      (new HoffCrab((int)random(213, 1270), (int)random(677, 698)));
  }

  //Seed MarineSnow
  marineSnowList = new ArrayList<MarineSnow>();
  //Record Bacteria Level
  bacteriaLevel = 710;
  //Set Snow Density
  density = 2;

  //Seed TubeWorms
  tubeWormList = new ArrayList<TubeWorm>();
  //tubeworm objects to start
  for (int i = 0; i < tubeWormSpawn; i++)
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
  rect(185, bacteriaLevel - 5, 20, 710 - bacteriaLevel);

   //Speed Control Label
   textSize(20);
   fill(#FFFFFF);
   text("Speed Control:", 25, 540);

  //display mouse position
  println("Mouse position: " + mouseX + ", " + mouseY);
}

//
//********************************************* UX Callback Methods **************************************************************
//
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

//callback for Pause
void pause()
{
  println("a button event: "+isPaused);

  if (isPaused == true)
  {
    loop();
    isPaused = false;
  } else
  {
    noLoop();
    isPaused = true;
  }
}

//Callback for Reset
void reset()
{
  isPaused = false;
  loop();
  setup();
}

//callback for SpeedControl
void speedControl(float value)
{
  if (value == 0) frameRate(30);
  if (value == 1) frameRate(60);
  if (value == 2) frameRate(120);
}
