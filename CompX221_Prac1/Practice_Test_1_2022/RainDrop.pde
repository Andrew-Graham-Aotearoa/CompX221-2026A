class RainDrop extends AbstractObject
{
  private int _size;


  public RainDrop
    (int x, int y, int size)
  {
    super( x, y, #1370BF);
    _size = size;
  }

  public void drawObject()
  {
    fill(_objectColor);
    circle(_position.x, _position.y, _size);
    
  }

  public void moveObject(int amount)
  {
   _position.y += amount; 
  }
  
  public void growObject(int amount)
  {
    _size += amount;
  }
  
   public String toString()
  {
    return "RainDrop:" + super.toString()
    + _size;
  }
  
}
