class Feature extends AbstractObject
{
 private int _width;
 private int _length;
  
  public Feature(int x, int y, color fColor, int wdth, int lgth)
  {
   super(x, y, fColor);
   _width = wdth;
   _length = lgth;
  }
  
  public void drawObject()
  {
    rectMode(CENTER);
    fill(_objectColor);
    rect(_position.x, _position.y, _width, _length);
  }
  
}
