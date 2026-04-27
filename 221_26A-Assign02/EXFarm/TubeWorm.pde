class TubeWorm extends Organism
{
  private PImage _tubeWorm;
  private int _snowConsumed;
  private Boolean _isAlive;
  public TubeWorm(int x, int y)
  {
    super(x, y);
    _tubeWorm = loadImage("tubeworm.png");
   _isAlive = true;
  }

  public void update()
  {
    if (b.getTempAt(_position)< 90 || b.getTempAt(_position)> 400)
    {
      _isAlive = false;
    }
  }

  public Boolean isAlive()
  {
    return _isAlive;
  }

  public void drawObject()
  {
    imageMode(CENTER);
    image(_tubeWorm, _position.x, _position.y, 30, 30);
  }
}
