class Triangle
{
  //create Fields for the 3 corners
  private PVector _c1;
  private PVector _c2;
  private PVector _c3;
  private color _lineColor;

  public Triangle(int c1x, int c1y, int c2x, int c2y,
    int c3x, int c3y, color lineColor)

  {
    _c1 = new PVector(c1x, c1y);
    _c2 = new PVector(c2x, c2y);
    _c3 = new PVector(c3x, c3y);
    _lineColor = lineColor;
  }

  public String toString()
  {
    return _c1.x + "," + _c1.y + " " + _c2.x + "," + _c2.y + " " +
      _c3.x + "," + _c3.y;
  }
  
  //Draws a triangle to the sketch windo in the given colour
  public void drawTriangle()
  {
   stroke(_lineColor);
   line(_c1.x, _c1.y, _c2.x, _c2.y);
   line(_c2.x, _c2.y, _c3.x, _c3.y);
   line(_c1.x, _c1.y, _c3.x, _c3.y); 
  }
  
  
}
