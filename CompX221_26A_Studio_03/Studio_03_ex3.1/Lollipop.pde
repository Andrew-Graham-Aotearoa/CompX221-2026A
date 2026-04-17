class Lollipop
{
  //create the fields
  private PVector _position;
  private color _handleCol;
  private color _lollyCol;
  private float _hgt;

  //Constant for Width
  final float WDTH = 4;
  

  //Constructor
  public Lollipop(float x, float y)
  {
    _position = new PVector(x, y);
    _handleCol = #FAF9D7;
    changeColor();
    
    //removed lollyCol from the constructor
    //_lollyCol =  lollyCol;
    
    _hgt = 60;
  }

   //Grow Method
   public void growLollipop()
   {
     _hgt = _hgt + 1;
   }

  //change color method
  public void changeColor()
  {
    _lollyCol = color(random(256), random(256), random(256));
  }


  //Draw Method
  public void drawLollipop()
  {
    fill(_handleCol);
    rect(_position.x, _position.y, WDTH, _hgt);
    fill(_lollyCol);
    circle(_position.x + 2, _position.y, _hgt/2);
  }
}
