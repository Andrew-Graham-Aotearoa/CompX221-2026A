class PlayerShip extends Sprite
{
  //create the fields
  // final creates a constant
 private final int SHIP_WIDTH = 50;
 private final int SHIP_HEIGHT = 10;
 
 
 //create the constuctor
 public PlayerShip(int x, int y)
 {
  super(x, y);
  _shipColor = #DE1D1D;
 }
 
 //abstract methods that were created
 //with the Superclass must be inherited 
 //and used to create these 
  public void drawSprite()
  {
    fill(_shipColor);
    rectMode(CENTER);
    rect(_center.x, _center.y, SHIP_WIDTH, SHIP_HEIGHT);
  }
  
  public void moveSprite(int amount)
  {
    _center.y += amount;
  }
}
