class Lollipop
{
  //create the fields
  private PVector _position;
  private color _handleCol;
  private color _lollyCol;

  //Constants for Width + Height
  final float WDTH = 4;
  final float HGT = 60;

  //Constructor
  public Lollipop(float x, float y, color lollyCol)
  {
    _position = new PVector(x, y);
    _handleCol = #FAF9D7;
    _lollyCol =  lollyCol;
  }

  //Draw Method
  public void drawLollipop()
  {
    fill(_handleCol);
    rect(_position.x, _position.y, WDTH, HGT);
    fill(_lollyCol);
    circle(_position.x + 2, _position.y, WDTH*5);
  }
}
