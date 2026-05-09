abstract class Organism
{
 protected PVector _position;
 
 public Organism (int x, int y)
 {
  _position = new PVector(x, y); 
 }
 
 public abstract void drawObject();

 
}
