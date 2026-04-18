//Name:
//ID:

ArrayList<AbstractObject> objectList = new ArrayList<AbstractObject>();

//Create reference variables for testing the classes
//WaterCatcher c1;
//WaterCatcher c2;
//RainDrop r1;
//RainDrop r2;

void setup()
{
  size(800, 600);

  String[] load = loadStrings("objects.csv");
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

    //watercatcher
    if (list.length == 4)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      wdth = Integer.parseInt(list[2]);
      hgt = Integer.parseInt(list[3]);

      objectList.add(new WaterCatcher(x, y, wdth, hgt ));
    }
    //raindrop
    if (list.length == 3)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      size = Integer.parseInt(list[2]);

      objectList.add(new RainDrop(x, y, size));
    }
  }


  //Create objects for the reference variables
  //c1 = new WaterCatcher(200, 500, 50, 10);
  //c2 = new WaterCatcher(500, 550, 50, 10);
  //r1 = new RainDrop(100, 50, 20);
  //r2 = new RainDrop(500, 30, 20);
  
  for (AbstractObject s : objectList)
  {
   println(s); 
  }
}

void draw()
{
  background(240);

  for (AbstractObject s : objectList)
  {
    s.drawObject();
    s.moveObject(1);
  }

  AbstractObject r=
    objectList.get(int(random(0, objectList.size()-1)));
  r.growObject(1);

  //Draw the objects to the sketch window
  //c1.drawObject();
  //c2.drawObject();
  //r1.drawObject();
  //r2.drawObject();
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    objectList.add(new WaterCatcher(mouseX, mouseY, 50, 10 ));
  }
  if (mouseButton == RIGHT)
  {
    objectList.add(new RainDrop(mouseX, mouseY, 20));
  }
}
