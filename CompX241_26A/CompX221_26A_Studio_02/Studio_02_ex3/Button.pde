class Button
{
  private PVector _position;
  private PVector _size;
  private color _col;

  public Button(float x, float y, float wdth, float hgt, color col)

  {
    _position = new PVector(x, y);
    _size = new PVector(wdth, hgt);
    _col = col;
  }
  
  public void drawButton()
  {
   fill(_col);
   rect(_position.x, _position.y, _size.x, _size.y);

  }
  
  
  
  
}
