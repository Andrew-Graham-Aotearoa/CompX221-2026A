//create an array to store different button object, and initialise it.
ArrayList<Button> buttonList = new ArrayList<Button>();


//sample buttons to test the logic
RectangleButton b1;
CircleButton c1 ;

void setup()
{
  size(800, 800);

  String[] load = loadStrings("buttons.csv");
  String[] list;

  for (String items : load)
  {
    list = split(items, ',');

    //variables to store the items
    int x;
    int y;
    String caption;
    int r;
    int g;
    int b;
    int w;
    int h;
    int s;

    if (list.length == 8)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      caption =            list[2] ;
      r = Integer.parseInt(list[3]);
      g = Integer.parseInt(list[4]);
      b = Integer.parseInt(list[5]);
      w = Integer.parseInt(list[6]);
      h = Integer.parseInt(list[7]);

      //Add a new Rectangle Button to the list
      buttonList.add( new RectangleButton(x, y, color(r, g, b), w, h, caption ));
    } else if (list.length == 6)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      r = Integer.parseInt(list[2]);
      g = Integer.parseInt(list[3]);
      b = Integer.parseInt(list[4]);
      s = Integer.parseInt(list[5]);

      //Add a new Circle Button to the list
      buttonList.add( new CircleButton(x, y, color(r, g, b), s));
    } else
    {
      println("error at" + items );
    }
  }



  //Sample Buttons
  //b1 = new RectangleButton
  //  (400, 400, #B946E8, 150, 100, "Rectangle");
  //c1 = new CircleButton
  //  (400, 500, #48E846, 50);
}

void draw()
{
  background(#FEFFDE);

  //draw all of the buttons in ButtonsList
  for (Button b : buttonList)
  {
    b.drawButton();
  }


  //test to see if the objects draw
  //b1.drawButton();
  //c1.drawButton();
}


void mousePressed()
{
  for (Button b : buttonList)
  {
    if (b.isClicked(mouseX, mouseY))
    {
      if (b instanceof RectangleButton)
      {
        println("Rectangle button has been clicked");
      } else if (b instanceof CircleButton)
      {
        println("Circle button has been clicked");
      }
    }
  }
}


//check to see if the Rectangle button is clicked
//void mousePressed()
//{
//  if (b1.isClicked(mouseX, mouseY))
//  {
//    println("Rectangle Button Click");
//  }

//  //check to see if the circle button is clicked
//  if (c1.isClicked(mouseX, mouseY))
//  {
//    println("Circle Button Clicked");
//  }
//}
