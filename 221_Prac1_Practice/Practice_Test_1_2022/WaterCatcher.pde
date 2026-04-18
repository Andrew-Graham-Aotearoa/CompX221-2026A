class WaterCatcher extends AbstractObject
{
  private int _cWidth;
  private int _cHeight;

  public WaterCatcher
    (int x, int y, int cWidth, int cHeight)
  {
    super( x, y, #B0BF13);
    _cWidth = cWidth;
    _cHeight = cHeight;
  }

  public void drawObject()
  {
    rectMode(CENTER);
    fill(_objectColor);
    rect(_position.x, _position.y, _cWidth, _cHeight);
    
  }

  public void moveObject(int amount)
  {
  }

  public void growObject(int amount)
  {
    _cWidth += amount;
  }

  public String toString()
  {
    return "Catcher:" + super.toString()
      + _cWidth + " " + _cHeight;
  }
}
