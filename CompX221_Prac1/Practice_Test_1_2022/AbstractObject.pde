abstract class AbstractObject
{
  protected PVector _position;
  protected color _objectColor;

  public AbstractObject (int x, int y, color objectColor)
  {
    _position = new PVector(x, y);
    _objectColor = objectColor;
  }

  public abstract void drawObject();
  public abstract void moveObject(int amount);
  public abstract void growObject(int amount);
  
  public String toString()
  {
    return _position.x + "," + _position.y + " ";
  }
}
