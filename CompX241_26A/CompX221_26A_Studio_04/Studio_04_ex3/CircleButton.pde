class CircleButton extends Button
{
  private int _size;

  //constructor
  public CircleButton
    (int x, int y, color buttonColor,
    int size)
  {
    super(x, y, buttonColor);
    _size = size;
  }

  public void drawButton()
  {
    fill(_buttonColor);
    circle(_center.x, _center.y, _size);
  }


  public boolean isClicked(int x, int y)
  {
    if (sq(x - _center.x) + (sq(y - _center.y)) < sq(_size/2))
    {
      return true;
    } else
    {
      return false;
    }
  }
}
