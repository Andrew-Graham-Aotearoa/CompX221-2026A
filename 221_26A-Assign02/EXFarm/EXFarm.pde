//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;
//Starting bacteriaLevel at OceanFloor
int bacteriaLevel = 710;


void setup()
{
  size(1280, 720);

  //Seed MarineSnow
  marineSnowList = new ArrayList<MarineSnow>();
}


void draw()
{
  background(0);

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
  if (bacteriaLevel <= 236)
    {
      fill(#f5f5f5);
      text("Bacteria Overpopulation!", width/2, height/2, 120);
      noLoop();
    }  
  fill(#39ff14);
    rect(180, bacteriaLevel - 20, 20, 710 - bacteriaLevel);
}

//testing for each that draws marine snow
//for (MarineSnow s : marineSnowList)
//{
//  s.drawObject();
//  s.moveObject();
//}
