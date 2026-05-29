abstract class AbstractObject
{
 protected PVector _position;
 protected color _objectColor;
 
 public AbstractObject(int x, int y, color objectColor)
 {
   _position = new PVector(x, y);
  _objectColor = objectColor;
 }
 
 public abstract void drawObject();
 
  
  
}
