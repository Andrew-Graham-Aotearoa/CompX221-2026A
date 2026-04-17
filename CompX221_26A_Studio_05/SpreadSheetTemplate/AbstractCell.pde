abstract class AbstractCell
{
  protected PVector _position;
  protected int _cellWidth;
  protected int _cellHeight;
  protected int _textSize;

  public AbstractCell
  (int x, int y, int cWidth, int cHeight, int textSize)
  {
    _position = new PVector(x, y);
    _cellWidth = cWidth;
    _cellHeight = cHeight;
    _textSize = textSize;
  }


  public abstract void drawCell();
  public abstract void txtSize(int amount);
}
