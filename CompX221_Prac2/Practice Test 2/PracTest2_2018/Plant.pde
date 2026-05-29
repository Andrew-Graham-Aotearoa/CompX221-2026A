class Plant extends AbstractObject
{
 private final int _TEXT_SIZE = 12;
 private int _size;
 private String _name;
  
  public Plant(int x, int y, color pColor, int size, String name)
  {
    super(x, y, pColor);
    _size = size;
    _name = name;
  }
  
  
  public void drawObject()
  {
    fill(_objectColor);
    ellipseMode(CENTER);
    ellipse(_position.x, _position.y, _size, _size);
    textAlign(CENTER);
    textSize(_TEXT_SIZE);
    fill(#000000);
    text(_name, _position.x, _position.y);
  }
  
  public void growPlant(int amount)
  {
   _size += amount; 
  }
  
}
