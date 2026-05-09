TeddyBear b1;
Wave w1;

void setup()
{
  size(800, 600);
  b1 = new TeddyBear(0, 0);
  w1 = new Wave(5);
}


void draw()
{
  background(255);
  b1.drawBear();
  b1.moveBear(2);
  
  w1.drawWave();
  w1.moveWave(2);
}
