void setup() {
  size(800, 800);
  rectMode(CENTER);
  frameRate(1.8);
  background(0);
}

void drawLevel(float centerX, float centerY, int level, float side)
{
  //stroke(225);
  noFill();
  rect(centerX, centerY, side, side);

  if (level > 0)
  {
    //Top Left
    stroke(random(256), random(256), random(256), random(255));
    drawLevel(centerX - side/2, centerY - side/2, level -1, side/2);
    //Top Right
    //stroke(random(256), random(256), random(256), random(255));
    drawLevel(centerX + side/2, centerY - side/2, level -1, side/2);
    //Bottom Right
    //stroke(random(256), random(256), random(256), random(255));
    drawLevel(centerX + side/2, centerY + side/2, level -1, side/2);
    //Bottom Left
    //stroke(random(256), random(256), random(256),random(255));
    drawLevel(centerX - side/2, centerY + side/2, level -1, side/2);
  }
}

void draw()
{
  //background(0);
  drawLevel(width/2, height/2, 5, 800);
}
