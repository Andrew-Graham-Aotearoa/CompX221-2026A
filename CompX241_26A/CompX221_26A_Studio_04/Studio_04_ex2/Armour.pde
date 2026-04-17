class Armour extends Item
{
  private int _points;

  //name, type, value (from Item)
  //+ points from Armour

  public Armour
    (String name, String type, int value,
    int points)
  {
    super(name, type, value);
    _points = points;
  }

  public String toString()
  {
    return super.toString() + " " + _points;
  }
  
  
}
