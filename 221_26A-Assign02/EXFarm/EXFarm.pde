//ArrayList for MarineSnow
ArrayList<MarineSnow> marineSnowList;



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
  for (MarineSnow s : marineSnowList)
  {
    s.drawObject();
    s.moveObject();
  }
}
