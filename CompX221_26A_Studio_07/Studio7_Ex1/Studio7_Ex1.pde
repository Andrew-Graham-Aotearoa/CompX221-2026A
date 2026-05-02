Garden g;

//Plant p;

void setup()
{
  size(800, 600);
  
  g = new Garden();
   //p = new Plant(200, 300, 50, #0C6C29);
}

void draw()
{
  g.drawGarden();
  g.growGarden();
  
  //p.drawPlant();
}

void mousePressed()
{
  g.addPlant(mouseX, mouseY, (int)random(20,51), #6DAD52); 
  //p.growPlant();
}
