PImage img;

void setup()
{
  size(1024, 768);
  img = loadImage("cute-cat.jpg");
}

void draw()
{
  //loads image at 0,0
  //image(img,0,0);

  float distance = 0;
  float x = 0;
  float y = 0;
  float diameter = 0;
  color c = 0;
  final int NUM_DOTS = 10;
  noStroke();
  
  if (mousePressed == true)
  {
    distance = dist(pmouseX, pmouseY, mouseX, mouseY );

    //FOR each dot to draw
    if (NUM_DOTS <= 10)
    diameter = random(2, distance);

    x = mouseX + random(-distance, distance);
    y = mouseY + random(-distance, distance);

    //get the color from the image at x and y, store in c
    c = img.get(int(x), int(y));

    fill(c, 30);

    ellipse(x, y, diameter, diameter);
  }
}
