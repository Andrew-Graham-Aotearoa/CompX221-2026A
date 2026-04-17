class Button
{
  private PVector _position;
  private PVector _size;
  private color _col;
  private String _name;

  public Button(float x, float y, float wdth, float hgt, color col, String name)

  {
    _position = new PVector(x, y);
    _size = new PVector(wdth, hgt);
    _col = col;
    _name = name;
  }

  public void drawButton()
  {
    fill(_col);
    rect(_position.x, _position.y, _size.x, _size.y);
  }

  public boolean isClicked()
  {
    //check to see if the mousex and mousey is within the button
    //if the mouse is over
    //return yes if it is/ no if not

    if (mouseX > (_position.x - (_size.x/2)) && mouseX < (_position.x + (_size.x/2))
      && mouseY > (_position.y - (_size.y/2)) && mouseY < (_position.y + (_size.y/2)))
    {
      return true;
    } 
    else
    {
      return false;
    }
  }
  
  //get method to see which button is activated
  public String getname()
  {
    return _name;
  }
}
