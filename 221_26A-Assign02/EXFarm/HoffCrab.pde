class HoffCrab extends Organism
{
  private PImage _hoffCrab;
  private Boolean _isAlive;
  private int _bacteriaConsumed;
  private int _vitality;
  private int _stepSize;

  public HoffCrab(int x, int y)
  {
    super(x, y);
    _hoffCrab = loadImage("HoffCrab.png");
    _isAlive = true;
    _bacteriaConsumed = 0;
    _vitality = 10;
    _stepSize = 6;
  }

  public Boolean isAlive()
  {
    return _isAlive;
  }

  public void update()
  {
    if (b.getTempAt(_position)> 30)
    {
      _vitality -= 1;
    }
    if (frameCount % 300 == 0)
    {
      _vitality -= 1;
    }
    if (_vitality <= 0)
    {
      _isAlive = false;
    }
    println("Crab vitality: " + _vitality + " temp: " + b.getTempAt(_position));
  }


  public void moveObject()
  {
    if (_isAlive == true)
    {
      if (_vitality < 5)
      {
        _stepSize = 3;
        huntBacteria();
      } else
      {
        _stepSize = 6;
      }

      if (frameCount %30 == 0)
      {
        int num = int(random(1, 5));
        if (num == 1)
        {
          _position.y += 1;
        }
        if (num == 2)
        {
          _position.y -= 1;
        }
        if (num == 3)
        {
          _position.x += _stepSize;
        }
        if (num == 4)
        {
          _position.x -= _stepSize;
        }
      }
    }
    _position.y = constrain(_position.y, 670, 700);
    _position.x = constrain(_position.x, 235, 1250);
  }


  public void eatBacteria()
  {
    for (int i = marineSnowList.size()-1; i >=0; i--)
    {
      //check distance between Crab and snow
      float d =
        dist(marineSnowList.get(i).getPosition().x,
        marineSnowList.get(i).getPosition().y, _position.x, _position.y);

      //if within 40px call snowconsumed()
      if (d < 40 && marineSnowList.get(i).isSnow() == false)
      {
        marineSnowList.remove(i);
        //Increment snow consumed
        _bacteriaConsumed += 1;
        bacteriaLevel += 20;
        _vitality += 1;
        _vitality = constrain(_vitality, 0, 10);
      }
    }
    //Reproduce + Consumption
    if (_bacteriaConsumed == 4)
    {
      //add a new HoffCrab to the list
      hoffCrabList.add
        (new HoffCrab((int)(_position.x)+(int)random(-145, 145), (int)constrain(_position.y, 670, 700)));
      //set bacteria consumed to 0
      _bacteriaConsumed = 0;
    }
  }

  public void huntBacteria()
  {
    float closestDist = Float.MAX_VALUE;

    PVector target = null;

    // loop through marineSnowList
    for (int i = marineSnowList.size()-1; i >=0; i--)
    {
      if (marineSnowList.get(i).isSnow() == false)
      {
        float d =
          dist(marineSnowList.get(i).getPosition().x,
          marineSnowList.get(i).getPosition().y, _position.x, constrain(_position.y, 670, 700));

        if (d < closestDist)
        {
          closestDist = d;
          target = marineSnowList.get(i).getPosition();
        }
      }
    }

    if (target != null)
    {
      if (target.x > _position.x)
      {
        _position.x += _stepSize;
      } else
      {
        _position.x -= _stepSize;
      }
    }
  }


  public void drawObject()
  {
    imageMode(CENTER);
    image(_hoffCrab, _position.x, _position.y, 40, 40);
  }
}
