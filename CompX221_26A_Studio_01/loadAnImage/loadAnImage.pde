PImage img;

void setup()
{
 size(1024, 768);
 img = loadImage("cute-cat.jpg");
}

void draw() 
{
  image(img,0,0);
}
