class TextCell extends AbstractCell
{
  private String _value;

  
  public TextCell(int x, int y, int cWidth, int cHeight, int textSize, String value)
  {
    super(x, y, cWidth, cHeight, textSize);
    _value = value;
  }
  
  public void drawCell()
  {
     fill(255);
     rectMode(CORNER);
     rect(_position.x, _position.y, _width, _height);
     fill(0);
     textAlign(CENTER);
     text(_value, _position.x+_width/2, _position.y+_height/2);
  }
} 
