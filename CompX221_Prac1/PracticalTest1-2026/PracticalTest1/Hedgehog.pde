class Hedgehog extends GardenObject
{
  private int _hogWidth;
  private int _hogHeight;

  public Hedgehog(int x, int y, int hogWidth, int hogHeight)
  {
    super(x, y, #6C510B);
    _hogWidth = hogWidth;
    _hogHeight = hogHeight;
  }

  public void drawObject()
  {
    fill(_objectColor);
    rectMode(CENTER);
    rect(_center.x, _center.y, _hogWidth, _hogHeight);
  }
  public void moveObject(int amount)
  {
    int num = int(random(1, 5));
    if (num == 1)
    {
      _center.y += amount;
    }
    if (num == 2)
    {
      _center.y -= amount;
    }
    if (num == 3)
    {
      _center.x += amount;
    }
    if (num == 4)
    {
      _center.x -= amount;
    }
  }
  public void growObject(int amount)
  {
    _hogWidth += amount;
    _hogHeight += amount;
  }

  public String toString()
  {
    return "Hedgehog" + _hogWidth + " " + _hogHeight;
  }
}
