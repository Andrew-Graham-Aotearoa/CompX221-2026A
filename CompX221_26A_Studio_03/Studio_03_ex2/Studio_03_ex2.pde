ArrayList<Button> buttonList = new ArrayList<Button>();

//Button b1;

void setup()
{
  size(800, 800);
  rectMode(CENTER);

  Button b1 = new Button(400, 400, 150, 50, #D66C6C, "b1");
  Button b2 = new Button(400, 500, 150, 50, #4746B7, "b2");
  Button b3 = new Button(400, 600, 150, 50, #83F539, "b3");
  
  buttonList.add(b1);
  buttonList.add(b2);
  buttonList.add(b3);
}

void draw()
{
  for (Button b : buttonList)
  {
    b.drawButton();
    
    //check to see if mouse is over the position
    if (b.isClicked())
    {
     println("Mouse Over"); 
    }
    
    //check to see if the button is clicked
    if (mousePressed && b.isClicked())
    {
     println("Button Clicked is " + b.getname()); 
    }
  }
  
  //check to see where mouse x and y is
    frameRate(12);
  println(mouseX + " : " + mouseY);
  
  
}
