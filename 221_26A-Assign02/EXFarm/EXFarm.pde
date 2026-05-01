//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;

//bacteriaLevel counter start
int bacteriaLevel = 710;

//ArrayList for TubeWorms
ArrayList<TubeWorm> tubeWormList;

//BlackSmoker Declaration
BlackSmoker b;

//HoffCrab ArrayList
ArrayList<HoffCrab> hoffCrabList;

void setup()
{
  size(1280, 720);

  //Seed HoffCrabs
  hoffCrabList = new ArrayList<HoffCrab>();
  //Hoff Crabs to Start
  for (int i = 0; i < 15; i++)
  {
   hoffCrabList.add
      (new HoffCrab((int)random(213, 1270), (int)random(677, 698)));
  }
  
  
  //Seed MarineSnow
  marineSnowList = new ArrayList<MarineSnow>();
  
  //Black Smoker object
  b = new BlackSmoker(700, 580);

  //Seed TubeWorms
  tubeWormList = new ArrayList<TubeWorm>();
  //tubeworm objects to start
  for (int i = 0; i < 8; i++)
  {
    tubeWormList.add
      (new TubeWorm((int)random(213, 1270), (int)random(677, 698)));
  }
}


void draw()
{
   // Background and Gradient variables
  color top = color(9, 92, 142); // Mid Blue
  color bottom = color(14, 48, 72); // Deep Blue
  //Gradient area is defined outside of the UI area.
  //Simulation Area
  int hSim = 600;
  int wSim = 1072;
  int simX= 213;
  int simY = 128;
  setGradient(simX, simY, wSim, hSim, top, bottom);

  //border around Gradient + Simulation Area
  noFill();
  stroke(#000000);
  strokeWeight(5);
  rect( simX, simY, wSim, hSim );

  //Header and TopBar Nav
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
  println("the temp is"+ " " + b.getTempAt(new PVector(mouseX,mouseY)));

  //MarineSnow
  if (frameCount %30 == 0)
  {
    marineSnowList.add
      (new MarineSnow((int)random(213, 1280), (int)random(0, 10-height)));
  }

  for (int i = marineSnowList.size()-1; i >=0; i--)
  {
    marineSnowList.get(i).drawObject();
    marineSnowList.get(i).moveObject();

     //check to see if modify snow is working
    //if (marineSnowList.get(i).isSnow() == false)
    //{
    //  println(marineSnowList.get(i).getPosition().y);
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
  

   //User Interface area (top and Sidebar)
  noStroke();
  fill(#095c8e);
  rect(0, 0, width, 128);
  rect(0, 128, 213, 600);

  //bacteriaLevel Visual Display
  fill(#39ff14);
  rect(180, bacteriaLevel - 20, 20, 710 - bacteriaLevel);
  
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
  //display mouse position
  println("Mouse position: " + mouseX + ", " + mouseY);
  
  
}
