abstract class Item
{
  protected String _name;
  protected String _type;
  protected int _value;


  //constructor
  public Item (String name, String type, int value)
  {
    _name = name;
    _type = type;
    _value = value;
  }
  
  public String toString()
  {
   return _name + " " + _type + " " + _value; 
  }
  
  
}
