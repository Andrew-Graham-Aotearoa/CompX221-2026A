class NumericCell extends AbstractCell
{
  private float _value;
  private int _numDP;

  public NumericCell
    (int x, int y, int cWidth, int cHeight, int textSize, float value, int numDP)
  {
   super(x, y, cWidth, cHeight, textSize);
    _value = value;
    _numDP = numDP;
  }
  
  public void drawCell()
  {
  fill(#FFFFFF);
  rectMode(CORNER);
  rect(_position.x, _position.y, _cellWidth, _cellHeight);
  fill(#000000);
  textAlign(CENTER);
  textSize(_textSize);
  text( nf((_value),0,_numDP), _position.x +(_cellWidth/2), _position.y +(_cellHeight/2)); 
   //text( _value, _position.x +(_cellWidth/2), _position.y +(_cellHeight/2)); 
  }
  
  public void txtSize(int amount)
  {
   _textSize += amount ; 
  }
  
}
