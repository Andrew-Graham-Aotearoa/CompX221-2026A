class NumericCell extends AbstractCell
{
  private float _value;
  private int _numDP;
  
  public NumericCell(int x, int y, int cWidth, int cHeight, int textSize, float value, int numDP)
  {
    super(x, y, cWidth, cHeight, textSize);
    _value = value;
    _numDP = numDP;
  }
  
  public void drawCell()
  {
    rectMode(CORNER);
    fill(255);
    rect(_position.x, _position.y, _width, _height);
    textSize(_textSize);
    textAlign(CENTER);
    fill(0);
    text(nf(_value,0,_numDP), _position.x+_width/2, _position.y+_height/2);
  }
}
