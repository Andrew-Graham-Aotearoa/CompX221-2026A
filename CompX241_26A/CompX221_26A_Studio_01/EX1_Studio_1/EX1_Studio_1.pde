final int WIDTH = 10;
final int HEIGHT = 10;
final int SIZE = 50;

void setup()
{
  size(800, 600);
  background(200);
  ellipseMode(CORNER);
}


void draw()
{
 drawGrid(8,12);
}

//created method
void drawGrid(int columns, int rows)
{
   int x = 0;
  int y = 0;

  //FOR each row to draw
  for (int row = 1; row <= rows; row++)
  {
    //FOR each column of jewels
    for (int col = 1; col <= columns; col++)
    {
      //Set the Color
      fill(random(256), random(256), random(256));
      //Draw Jewel at current position
      ellipse(x, y, SIZE, SIZE);
      //Shift x to the right
      x += SIZE;
    }
    //Shift x to the start of the row
    x = 0;
    //Shift y down by the height
    y += SIZE;
  }
  noLoop();
  
}  
  
