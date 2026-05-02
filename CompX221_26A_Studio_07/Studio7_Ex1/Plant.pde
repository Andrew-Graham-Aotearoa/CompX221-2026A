class Plant 
{
 private PVector _center;
 private int _size;
 private color _pColor;
 
 public Plant (int x, int y, int size, color pColor)
 {
  _center = new PVector(x, y);
  _size = size;
  _pColor = pColor;
 }
  
  public void drawPlant()
  {
    noStroke();
    fill(_pColor);
    ellipseMode(CENTER);
    ellipse(_center.x, _center.y, _size, _size);
  }
  
  public void growPlant()
  {
   _size += 1; 
  }

  
}
