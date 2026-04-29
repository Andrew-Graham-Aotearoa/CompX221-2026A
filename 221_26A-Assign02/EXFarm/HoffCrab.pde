class HoffCrab extends Organism
{
  private PImage _hoffCrab;
  private Boolean _isAlive;
  private int _bacteriaConsumed;

  public HoffCrab(int x, int y)
  {
    super(x, y);
    _hoffCrab = loadImage("HoffCrab.png");
    _isAlive = true;
    _bacteriaConsumed = 0;
  }

  public Boolean isAlive()
  {
    return _isAlive;
  }
  
   public void update()
  {
    if (b.getTempAt(_position)< 3 || b.getTempAt(_position)> 30)
    {
      _isAlive = false;
    }
  }

  public void moveObject()
  {
    if (_isAlive == true)
    {
      if (frameCount %30 == 0)
      {
        int num = int(random(1, 5));
        if (num == 1)
        {
          _position.y += 2;
        }
        if (num == 2)
        {
          _position.y -= 2;
        }
        if (num == 3)
        {
          _position.x += 5;
        }
        if (num == 4)
        {
          _position.x -= 5;
        }
      }
    }
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
      }
    }
    //if snow consumed reaches 5
    if (_bacteriaConsumed == 15)
    {
      //add a new HoffCrab to the list
      hoffCrabList.add
        (new HoffCrab((int)(_position.x)+(int)random(-145, 145), (int)_position.y));
      //set bacteria consumed to 0
      _bacteriaConsumed = 0;
    }
  }


  public void drawObject()
  {
    imageMode(CENTER);
    image(_hoffCrab, _position.x, _position.y, 40, 40);
  }
 
}


//pushMatrix();
          //translate(_position.x, _position.y);
          //rotate(-HALF_PI);
          //imageMode(CENTER);
          //loadImage("HoffCrab.png");
          //popMatrix();
