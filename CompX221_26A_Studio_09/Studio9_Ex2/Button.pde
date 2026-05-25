class Button
{
  private int _bHeight;
  private int _bWidth;
  private PFont _font;
  private String _caption;
  private PVector _center;
  private color _buttonColor;

  //constructor
  public Button
    (int x, int y, color buttonColor,
    int bHeight, int bWidth, String caption)
  {

    _center =  new PVector(x, y);
    _buttonColor = buttonColor;
    _bHeight = bHeight;
    _bWidth = bWidth;
    _font = createFont("Didot-Bold-14.vlw", 14);
    _caption = caption;
  }

  // 2 methods to apply
  public void drawButton()
  {
    fill(_buttonColor);
    rectMode(CENTER);
    rect(_center.x, _center.y, _bHeight, _bWidth);
    textFont(_font);
    textAlign(CENTER);
    fill(#444848);
    text(_caption, _center.x, _center.y);
  }

  public boolean isClicked( int x, int y)
  {
    //check to see if the x and y is within the button
    //if the mouse is over
    //return yes if it is/ no if not

    if (x > (_center.x - (_bWidth/2)) && x < (_center.x + (_bWidth/2))
      && y > (_center.y - (_bHeight/2)) && y < (_center.y + (_bHeight/2)))
    {
      return true;
    } else
    {
      return false;
    }
  }
}
