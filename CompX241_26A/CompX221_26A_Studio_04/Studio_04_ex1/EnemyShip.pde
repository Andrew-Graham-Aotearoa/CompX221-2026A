class EnemyShip extends Sprite
{
  //create the fields
  // final creates a constant
 private final int SIZE = 40;
 
 //create the constuctor
 public EnemyShip(int x, int y)
 {
  super(x, y);
  _shipColor = #76DE1D;
 }
  //add the required methods
    public void drawSprite()
  {
    fill(_shipColor);
    ellipseMode(CENTER);
    ellipse(_center.x, _center.y, SIZE, SIZE);
  }
  
  public void moveSprite(int amount)
  {
    _center.x -= amount;
  }
  
  
 }
