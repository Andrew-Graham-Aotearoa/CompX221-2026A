class TextCell extends AbstractCell
{
  private String _value;

  //this constructer must call the new class, not the abstract class

  public TextCell
    (int x, int y, int cWidth, int cHeight, int textSize, String value)
  {
    super(x, y, cWidth, cHeight, textSize);
    _value = value;
  }

  public void drawCell()
  {
    rectMode(CORNER);
    fill(#FFFFFF);
    rect(_position.x, _position.y, _cellWidth, _cellHeight);
    fill(#000000);
    textAlign(CENTER);
    textSize(_textSize);
    text(_value, _position.x +(_cellWidth/2), _position.y + (_cellHeight/2));
  }
  
    public void txtSize(int amount)
  {
   _textSize += amount ; 
  }
}
