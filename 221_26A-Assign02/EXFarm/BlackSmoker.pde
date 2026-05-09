class BlackSmoker extends Organism
{
  private PImage _blackSmoker;
  private final int MAXTEMP = 453;
  private final int MINTEMP = 3;
  private float _size = 150;
  private float _heatRadius;
  public BlackSmoker(int x, int y)
  {
    super(x, y);
    _blackSmoker = loadImage("blackSmoker.png");
    _heatRadius = _size * 0.9;
 
    
  }

  public int getTempAt(PVector location)
  { 
    float d = dist(location.x, location.y, _position.x, _position.y - (_size/2));
    if (d < _heatRadius)
    {
      //constrain the temp between max and min, +  set temp outside this area to MINTEMP
    return (int)constrain(map(d, 0, _heatRadius, MAXTEMP, MINTEMP), MINTEMP, MAXTEMP);
    }
    else return MINTEMP;
  }

public void setSize(float size)
{
 _size = size;
 _heatRadius = size * 0.9;
}

public float getHeatRadius()
{
 return _heatRadius; 
}

  public void drawObject()
  {
    imageMode(CENTER);
    image(_blackSmoker, _position.x, _position.y - (_size/2), _size, _size);
  }
}
