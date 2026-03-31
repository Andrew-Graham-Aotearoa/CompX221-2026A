ArrayList<Lollipop> lollipopList = new ArrayList<Lollipop>();

// Test to see if one Lollipop will draw
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
  //unneeded because of changeColor() method added to the constructor
  //color lollyCol = color(random(256), random(256), random(256));



  if (mousePressed)
  {
    lollipopList.add (new Lollipop(mouseX, mouseY));
    for (Lollipop l : lollipopList)
    {
      //check to see if the array has contents
      if (! lollipopList.isEmpty())
      {

        //investigate the Array and create a random new entry
        int grow = int(random(0, lollipopList.size()-1));

        // apply the grow method to the generated array variable
        lollipopList.get(grow).growLollipop();

        //draw the lollipop
        l.drawLollipop();
        if (keyPressed)
        {
          lollipopList.get(grow).changeColor();
        }
      }
    }
  }
}
