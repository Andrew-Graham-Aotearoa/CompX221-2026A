class TeddyBear
{
  private PVector _center;
  private PImage _img;
  private int _direction;

  public TeddyBear(int x, int y)
  {
    _center = new PVector(x, y);
    _img = loadImage("teddybearicon.jpg");
    _direction = 1;
  }
  
  public void drawBear()
  {
    imageMode(CENTER);
    image(_img, _center.x + 50, _center.y+ 100);
  }
  
  public int getWidth()
  {
  int w = _img.width; 
  return w;
  }
  
  public void moveBear(int amount)
  {
   _center.x += amount * _direction;
   
  
   if(_center.x < 0 || _center.x + 90 > width)
   {
     _direction = _direction * -1;
     _center.y +=_img.height;
     
    _center.x += amount * _direction; 
   }
  }
  
}
