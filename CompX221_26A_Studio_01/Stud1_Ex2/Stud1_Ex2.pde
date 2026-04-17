
void setup()
{
  size(800, 600);
  background(200);
}

void draw()
{
  //int xPos = int(random(width));
  //int yPos = int(random(height));

  //Ellipse size
  float ellipseSize = random(2, 10);

  //Number of Circles
  int numCircles = int(random(11));

  //X and Y mousePosition + or - 10
  int xPos = int(random(-10, 10));
  int yPos = int(random(-10, 10));

  //Variables for R, G, B
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));


  if (mousePressed == true)
  {
    //Setting Fill and Stroke
    noStroke();
    
    //loop to generate a number of circles from 0 to 10
    for (int i=0; i < numCircles; i++)
    {
      fill(r, g, b);

      //Drawing a Line from a random x and y position to the mouse
      //line(xPos, yPos, mouseX, mouseY);

      //drawing an ellipse at mouse position ellipseSize diameter
      ellipse(mouseX+ xPos, mouseY+ yPos, ellipseSize, ellipseSize);
    }
  }
  if (keyPressed == true) 
  {
    //save the frame
    saveFrame("myPicture.png");
  }
}
