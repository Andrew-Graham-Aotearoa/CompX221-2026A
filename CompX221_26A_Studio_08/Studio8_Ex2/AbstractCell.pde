abstract class AbstractCell
{
  protected PVector _position;
  protected int _width;
  protected int _height;
  protected int _textSize;
  
  public AbstractCell(int x, int y, int cWidth, int cHeight, int textSize)
  {
    _position = new PVector(x, y);
    _width = cWidth;
    _height = cHeight;
    _textSize = textSize;
  }
  
  
  public void changeTextSize(int newSize)
  {
    _textSize += newSize; 
  }
  
  public abstract void drawCell();
  
}
