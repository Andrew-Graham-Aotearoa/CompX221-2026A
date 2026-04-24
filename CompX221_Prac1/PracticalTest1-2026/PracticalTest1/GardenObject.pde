abstract class GardenObject
{
 protected PVector _center;
 protected color _objectColor;
 
 public GardenObject (int x, int y, color objectColor)
 {
  _center = new PVector(x, y);
  _objectColor = objectColor;
 }
 
 public abstract void drawObject();
 public abstract void moveObject(int moveAmount);
 public abstract void growObject(int growAmount);
 
 public String toString()
 {
  return _center.x + " " + _center.y + " "; 
 }
 
}
