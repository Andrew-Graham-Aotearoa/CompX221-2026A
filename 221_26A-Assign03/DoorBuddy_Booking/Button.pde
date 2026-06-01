class Button
{
  private PVector _center;
  private color _buttonColor;
  private int _bHeight;
  private int _bWidth;
  private String _caption;
  private boolean _isSelected;
  private color _selectedColor;

  public Button(int x, int y, color buttonColor, int bWidth, int bHeight, String caption)
  {
    
     _center =  new PVector(x, y);
    _buttonColor = buttonColor;
    _bHeight = bHeight;
    _bWidth = bWidth;
    _caption = caption;
    _isSelected = false;
    _selectedColor = #D35353;   
  }
  
  public void drawButton()
  {
    rectMode(CENTER);
    
    if (_isSelected == true)
    {
      fill(_selectedColor);
    } 
    else
    {
      fill(_buttonColor);
    }
    
    rect(_center.x, _center.y, _bWidth, _bHeight);
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
      _isSelected = true;
      return true;
    } else
    {
      return false;
    }
  }
  
  public void deselectObject()
  {
    _isSelected = false;
  }
  
  
  
}
