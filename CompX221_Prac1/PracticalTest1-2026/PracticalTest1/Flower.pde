class Flower extends GardenObject
{
  private int _size;

  public Flower(int x, int y, int size)
  {
    super(x, y, #57CE13);
    _size = size;
  }

  public void drawObject()
  {
    fill(_objectColor);
    circle(_center.x, _center.y,_size);
  }
  public void moveObject(int amount)
  {
  }
  public void growObject(int amount)
  {
    _size+= amount;
  }
  
   public String toString()
 {
  return "Flower" + super.toString() + _size; 
 }
  
}
