class Plant extends GardenObject
{

  private int _size;

  public Plant(int x, int y, int size, color pColor)
  {
    super(x, y, pColor);
    _size = size;
  }


  public boolean isClicked(int x, int y)
  {
    if (pow(x - _centre.x, 2) + pow(y - _centre.y, 2) < pow(_size/2, 2))
    {
      _isSelected = true;
      return true;
    } else
    {
      return false;
    }
  }

  public void drawObject()
  {
    ellipseMode(CENTER);
    if (_isSelected == true)
    {
      fill(_selectedColor);
    } 
    else
    {
      fill(_objColor);
    }
    ellipse(_centre.x, _centre.y, _size, _size);
  }
  
  public void growPlant()
  {
    _size += 1;
  }
  
}
