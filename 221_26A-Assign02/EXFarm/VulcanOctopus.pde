class VulcanOctopus extends Organism
{
  private PImage _vulcanOctopus;
  private Boolean _isAlive;
  private int _crabsConsumed;
  private int _vitality;
  private int _stepSize;

  public VulcanOctopus(int x, int y)
  {
    super(x, y);
    _vulcanOctopus = loadImage("vulcanOctopus.png");
    _isAlive = true;
    _crabsConsumed = 0;
    _vitality = 20;
    _stepSize = 6;
  }

  public Boolean isAlive()
  {
    return _isAlive;
  }

  public void update()
  {
    if (b.getTempAt(_position)> 300 || b.getTempAt(_position)< 45)
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
    println("Vulcanoctopus vitality: " + _vitality + " temp: " + b.getTempAt(_position));
  }



  public void moveObject()
  {
    if (_isAlive == true)
    {
      if (_vitality < 15)
      {
        _stepSize = 1;
        huntCrabs();
      } else
      {
        _stepSize = 2;
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

  public void huntCrabs()
  {
    float closestDist = Float.MAX_VALUE;

    PVector target = null;

    // loop through HoffCrabList
    for (int i = hoffCrabList.size()-1; i >=0; i--)
    {
      float d =
        dist(hoffCrabList.get(i).getPosition().x,
        hoffCrabList.get(i).getPosition().y, _position.x, constrain(_position.y, 670, 700));

      //if temp is survivable, Hunt Crabs
      if (b.getTempAt(hoffCrabList.get(i).getPosition()) < 300
        && b.getTempAt(hoffCrabList.get(i).getPosition()) > 45)
      {
        if (d < closestDist)
        {
          closestDist = d;
          target = hoffCrabList.get(i).getPosition();
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

  public void eatCrabs()
  {
    for (int i = hoffCrabList.size()-1; i >=0; i--)
    {
      //check distance between Octopus  and Crab
      float d =
        dist(hoffCrabList.get(i).getPosition().x,
        hoffCrabList.get(i).getPosition().y, _position.x, _position.y);

      //if within 40px Conusume()
      if (d < 40)
      {
        hoffCrabList.remove(i);
        //Increment Crabs consumed
        _crabsConsumed += 1;
        _vitality += 2;
        _vitality = constrain(_vitality, 0, 20);
      }
    }
    //Reproduce + Consumption
    if (_crabsConsumed == 4)
    {
      //add a new HoffCrab to the list
      vulcanOctopusList.add
        (new VulcanOctopus((int)(_position.x)+(int)random(-45, 45), (int)constrain(_position.y, 670, 700)));
      //set bacteria consumed to 0
      _crabsConsumed = 0;
    }
  }

  public PVector getPosition()
  {
    return _position;
  }



  public void drawObject()
  {
    imageMode(CENTER);
    image(_vulcanOctopus, _position.x, _position.y, 40, 40);
  }
}
