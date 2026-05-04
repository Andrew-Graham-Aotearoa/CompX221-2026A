class EruptionRock
{
  private PVector _position;
  private float _vx;
  private float _vy;
  private boolean _isVisible;
  private final int OCEANFLOOR = 710;
  private PImage _rock;

  public EruptionRock(int x, int y)
  {
    _position = new PVector(x, y);
    _rock = loadImage("rock.png");
    _vx = random(-5, 5);
    _vy = random(-8, -2);
    _isVisible = true;
  }

  public void moveObject()
  {
    _position.x += _vx;
    _position.y += _vy;
    //Add Gravity
    _vy += 0.2;
    if (_position.y >= OCEANFLOOR)
    {
      _isVisible = false;
    }
  }
  public Boolean isVisible()
  {
    return _isVisible;
  }

  public PVector getPosition()
  {
    return _position;
  }

  public void checkCollision()
  {
    // loop through each organism list
    // check distance
    // set _isAlive = false if hit
  }

  public void drawObject()
  {
    imageMode(CENTER);
    image(_rock, _position.x, _position.y, 20, 20);
  }
}
