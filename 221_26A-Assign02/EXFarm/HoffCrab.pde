class HoffCrab extends Organism
{
 private PImage _hoffCrab;
 
 
 public HoffCrab(int x, int y)
 {
   super(x, y);
   _hoffCrab = loadImage("HoffCrab");
 }
  
  
  
  public void drawObject()
  {
    imageMode(CENTER);
    image(_hoffCrab, _position.x, _position.y, 35, 35);
  }
  
  
}
  
  
