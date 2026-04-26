class BlackSmoker extends Organism
{
  private PImage _blackSmoker;
  private int _temp = 90;
  private final int MAXTEMP = 453;
  private final int MINTEMP = 3;
  public BlackSmoker(int x, int y)
  {
    super(x, y);
    _blackSmoker = loadImage("blackSmoker.png");
  }

  public int getTempAt(PVector location)
  {
    float d = dist(location.x, location.y, _position.x, _position.y);
    return (int)map( d, 0, 1200, MAXTEMP, MINTEMP);
  }

public void setTemp(int temp)
{
 _temp = temp;  
}


  public void drawObject()
  {
    imageMode(CENTER);
    image(_blackSmoker, _position.x, _position.y, 300, 300);
  }
}
