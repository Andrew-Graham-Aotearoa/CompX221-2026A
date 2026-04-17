//create the reference variable to create an object
PlayerShip p;

//create an array list to store the enemy ships
ArrayList<EnemyShip> enemyShipList;


void setup()
{
  size(800, 600);
  p = new PlayerShip(50, height/2);

  enemyShipList = new ArrayList<EnemyShip>();
}

void draw()
{
  background(0);

  if (frameCount % 30 == 0)
  {
    enemyShipList.add(new EnemyShip(width, (int)random(10, height-10)));
  }

  p.drawSprite();

  for (EnemyShip e : enemyShipList)
  {
    e.drawSprite();
    e.moveSprite(4);
  }
}
//moves the object up and down
void keyPressed()
{
  if ( key == CODED)
  {
    if (keyCode == UP)
    {
      p.moveSprite(-4);
    } else if (keyCode == DOWN)
    {
      p.moveSprite(4);
    }
  }
}
