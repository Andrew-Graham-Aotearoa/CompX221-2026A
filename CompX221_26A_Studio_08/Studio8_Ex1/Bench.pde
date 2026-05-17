class Bench extends GardenObject
{
  private int _width;
  private int _height;
  
  public Bench(int x, int y, int bWidth, int bHeight, color bColor)
  {
  super(x, y, bColor);
  _width = bWidth;
  _height = bHeight;  
  }
  
  public boolean isClicked(int x, int y)
  {
    if (x >= _centre.x - _width/2 && x <= _centre.x + _width/2 &&
        y >= _centre.y - _height/2 && y <= _centre.y + _height/2)
    {
       _isSelected = true;
       return true;
    }
    else
    {
       return false; 
    }
  }
  
  public void drawObject()
  {
    rectMode(CENTER);
    
     if (_isSelected == true)
    {
      fill(_selectedColor);
    } 
    else
    {
      fill(_objColor);
    }
    rect(_centre.x, _centre.y, _height, _width);
  }
  
  //public void growObject()
  //{}
}
