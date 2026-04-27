class MarineSnow extends Organism
{
  private PImage _snow;
  private PImage _bacteria;
  private Boolean _isSnow;
  private float _speed;
  private final int OCEANFLOOR = 710;
  public MarineSnow(int x, int y)
  {
    super(x, y);
    _snow = loadImage("snowflake_.png");
    _bacteria = loadImage("bacteria_.png");
    _speed = (float)random(0.1, 1);
    _isSnow = true;
  }

  public void drawObject()
  {
    imageMode(CENTER);

    if (_isSnow == true && _position.y < OCEANFLOOR)
    {
      image(_snow, _position.x, _position.y, 20, 20);
    } else
    {
      image(_bacteria, _position.x, _position.y, 25, 25);
      if (_position.y>= OCEANFLOOR)
      {
        modify();
      }
    }
  }

  public void modify()
  {
    println("modify called"+ " " + _isSnow);

    if (_isSnow == false)
    {
      return;
    } else if (_isSnow == true)
    {
      //decrease y-axis level to the Top of the Black Smoker/
      //set to bacteria
      bacteriaLevel -= 20;
      _isSnow = false;
    }
  }

  public void moveObject()
  {
    if (_isSnow == true)
    {
      if (_position.y < OCEANFLOOR)
      {
        _position.y += _speed;
      } else if (_position.y >= OCEANFLOOR)
      {
        modify();
      }
    }
  }

  public Boolean isSnow()
  {
    return _isSnow;
  }
  
  public void setEaten()
  {
   _isSnow = true; 
  }

  public PVector getPosition()
  {
    return _position;
  }
}
