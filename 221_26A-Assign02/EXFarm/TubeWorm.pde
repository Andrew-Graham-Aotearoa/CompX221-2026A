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
    _snowConsumed = 0;
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

  public void eatSnow()
  {
    for (int i = marineSnowList.size()-1; i >=0; i--)
    {
      dist(getSnowPostion(),_position.x, _position.y);
      //check distance between tubeworm and snow

      //if within 40px call snowconsumed()
      //Increment snow comsumed

      //if snow consumed reaches 5
      if (_snowConsumed == 5)
      {
        //add a new tubeworm to the list
       tubeWormList.add
       (new TubeWorm((int)(_position.x)+(int)random(-40, 40),(int)_position.y));
        //set snow consumed to 0
        _snowConsumed = 0;
      }
    }
  }

    public void drawObject()
    {
      imageMode(CENTER);
      image(_tubeWorm, _position.x, _position.y, 35, 35);
    }
  }
