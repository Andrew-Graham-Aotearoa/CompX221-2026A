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
      //check distance between tubeworm and snow
      float d =
        dist(marineSnowList.get(i).getPosition().x,
        marineSnowList.get(i).getPosition().y, _position.x, _position.y);

      //if within 40px call snowconsumed()
      if (d < 40 && marineSnowList.get(i).isSnow() == true)
      {
        //set snow consumed
        marineSnowList.get(i).setEaten();
        //decrement marinesnowlist
        marineSnowList.remove(i);
        //Increment snow consumed
        _snowConsumed += 1;
      }
    }
    //if snow consumed reaches 5
    if (_snowConsumed == 5)
    {
      //add a new tubeworm to the list
      tubeWormList.add
        (new TubeWorm((int)(_position.x)+(int)random(-45, 45), (int)_position.y));
      //set snow consumed to 0
      _snowConsumed = 0;
    }
  }

  public void drawObject()
  {
    imageMode(CENTER);
    image(_tubeWorm, _position.x, _position.y, 40, 40);
  }
}
