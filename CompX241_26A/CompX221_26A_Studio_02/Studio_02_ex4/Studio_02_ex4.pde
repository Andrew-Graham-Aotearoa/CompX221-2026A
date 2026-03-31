ArrayList<Lollipop> lollipopList = new ArrayList<Lollipop>();

// Test to see if the Lollipop will draw
//Lollipop l1;

void setup()
{
  size(800, 800);
  background (#6F90E0);

  //Drawing one Lollypop using l1
  // color lollyCol = color(random(256), random(256), random(256));
  //l1 = new Lollipop(400, 400, lollyCol);
}

void draw()
{
  color lollyCol = color(random(256), random(256), random(256));

  if (mousePressed)
  {
    lollipopList.add (new Lollipop(mouseX, mouseY, lollyCol));
    for (Lollipop l : lollipopList)
    {
      l.drawLollipop();
    }
  }

  // Test code to draw one Lollipop
  //l1.drawLollipop();
}
