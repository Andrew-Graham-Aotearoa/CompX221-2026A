class EruptionRock
{
  private PVector _position;
  private float _vx;
  private float _vy;
  private boolean _isVisible;
  private final int OCEANFLOOR = 710;
  private PImage _rock;
  private final int KILL_RADIUS = 10;

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

//Collision Event checker aka Mass Extinction
  public void checkCollision()
  {
    //Rock v Crab
    for (int i = hoffCrabList.size()-1; i >=0; i--)
    {
      //check distance between Rock and Crab
      float d =
        dist(hoffCrabList.get(i).getPosition().x,
        hoffCrabList.get(i).getPosition().y, _position.x, _position.y);

      //if within KILL_RADIUS remove()
      if (d < KILL_RADIUS)
      {
        hoffCrabList.remove(i);
        _isVisible = false;
      }
    }
    //Rock v Vulcanoctopus
     for (int i = vulcanOctopusList.size()-1; i >=0; i--)
    {
      //check distance between Rock and Octopus
      float d =
        dist(vulcanOctopusList.get(i).getPosition().x,
        vulcanOctopusList.get(i).getPosition().y, _position.x, _position.y);

      //if within KILL_RADIUS remove()
      if (d < KILL_RADIUS)
      {
        vulcanOctopusList.remove(i);
        _isVisible = false;
      }
    }
    //Rock v TubeWorm
    for (int i = tubeWormList.size()-1; i >=0; i--)
    {
      //check distance between Rock and Crab
      float d =
        dist(tubeWormList.get(i).getPosition().x,
        tubeWormList.get(i).getPosition().y, _position.x, _position.y);

      //if within KILL_RADIUS remove()
      if (d < KILL_RADIUS)
      {
        tubeWormList.remove(i);
        _isVisible = false;
      }
    }
  }

  public void drawObject()
  {
    imageMode(CENTER);
    image(_rock, _position.x, _position.y, 20, 20);
  }
}
