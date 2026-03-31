
//create an abstract class
// this class cannot create an object, used to group common things
//Objects are created in the subclass derived from this class
abstract class Sprite //<>//
{ //<>//
  protected PVector  _center; //<>//
  protected color  _shipColor;

//Constructor
  public Sprite (int x, int y)
  {
    _center = new PVector(x, y);
  }
  
  //create an abstract method 
  //note: there is a ";" at the end of these
  
  public abstract void drawSprite();
  public abstract void moveSprite(int amount);
  
  
  
}
