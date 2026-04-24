ArrayList<GardenObject> objectList = new ArrayList<GardenObject>();



//Create a reference variable for a flower object for testing purposes
//Flower f1;
//Create a reference variable for a hedgehog object for testing purposes
//note to marker the class name for Hedgehog is not the same as the original
//test code "HedgeHog"
//Hedgehog h1;

void setup()
{
  //Set the size of the sketch window
    size(800, 600);

    //Make sure that ellipses and rectangles will be drawn centred around it's x and y position
    ellipseMode(CENTER);
    rectMode(CENTER);
    //Turn off outlines around the shapes
    noStroke();
    
  //load the csv and extract data
  String[] load = loadStrings("data.csv");
  String[] list;

  for (String items : load)
  {
    list = split(items, ',');

    //list of items
    int x;
    int y;
    int wdth;
    int hgt;
    int size;

    //Hedgehog
    if (list.length == 4)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      wdth = Integer.parseInt(list[2]);
      hgt = Integer.parseInt(list[3]);

      objectList.add(new Hedgehog(x, y, wdth, hgt));
    }

    //Flower
    if (list.length == 3)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      size = Integer.parseInt(list[2]);

      objectList.add(new Flower(x, y, size));
    }


    //Create a new flower object for testing purposes
    //f1 = new Flower(100, 200, 40);
    //Create a new hedgehog object for testing purposes
    //h1 = new Hedgehog(200, 300, 20, 10);

    //Turn off outlines around the shapes
    noStroke();

    //Set the frame rate to 5 to slow things down
    frameRate(5);

    //Print the values of the two objects to the console window
    //println(f1);
    //println(h1);

    for (GardenObject s : objectList)
    {
      println(s);
    }
  }
}
void draw()
{
  //Set the background colour of the sketch window
  background(200);

  //draw the objects from the csv file
   for (GardenObject s : objectList)
  {
    s.drawObject();
    s.moveObject(5);
  }

  //Draw the 2 objects to the sketch window for testing purposes
  //f1.drawObject();
  //h1.drawObject();

  //Make the objects grow for testing purposes
  //f1.growObject(2);
  //h1.growObject(2);

  //Make the hedgehog move for testing purposes
  //h1.move(4);
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    //Add a new flower object to your array list
    objectList.add(new Flower(mouseX, mouseY, 30));
  } else if (mouseButton == RIGHT)
  {
    //Add a new hedgehog object to your array list
    objectList.add(new Hedgehog(mouseX, mouseY, 20, 10 ));
  }
}
