Garden g;


void setup()
{
  size(800, 600);

  g = new Garden();
  
}

void draw()
{
  background(245);

  g.drawGarden();
}

void mousePressed()
{
  g.handleClick(mouseX, mouseY); 
}

void keyPressed()
{
  if(key == 'b')
  {
    g.addBench(mouseX,mouseY,(int)random(50, 100), 10, #744813); 
  }
  else if(key == 'p')
  {
    g.addPlant(mouseX,mouseY, (int)random(20,80), #1C7E4E);
  }
  else if(key == 'g')
  {
    g.growGarden(); 
  }
