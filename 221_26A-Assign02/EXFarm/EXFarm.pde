//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;

//bacteriaLevel counter start
int bacteriaLevel = 710;

//ArrayList for TubeWorms
ArrayList<TubeWorm> tubeWormList;

//BlackSmoker Declaration
BlackSmoker b;

void setup()
{
  size(1280, 720);

  //Seed MarineSnow
  marineSnowList = new ArrayList<MarineSnow>();

  //Black Smoker object
  b = new BlackSmoker(700, 580);
  
  //Seed TubeWorms
  tubeWormList = new ArrayList<TubeWorm>();
  //tubeworm objects to start
  for (int i = 0; i < 20; i++)
  {
    tubeWormList.add
      (new TubeWorm((int)random(321, 994), (int)random(677, 698)));
  }
}


void draw()
{
  background(0);

  //BlackSmoker / Draw
  b.drawObject();

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

    if (marineSnowList.get(i).isSnow() == false)
    {
      println(marineSnowList.get(i).getPosition().y);
    }
  }
  //Simulation End Condition
  if (bacteriaLevel <= 235)
  {
    fill(#f5f5f5);
    textSize(80);
    text("Bacteria Overpopulation!", width/4, height/2);
    noLoop();
  }
  //bacteriaLevel Visual Display
  fill(#39ff14);
  rect(180, bacteriaLevel - 20, 20, 710 - bacteriaLevel);


  //Tubeworm Display
  for (int i = tubeWormList.size()-1; i >=0; i--)
  {
    tubeWormList.get(i).drawObject();
    tubeWormList.get(i).eatSnow();
    tubeWormList.get(i).update();
  }

  //display mouse position
  println("Mouse position: " + mouseX + ", " + mouseY);
}
