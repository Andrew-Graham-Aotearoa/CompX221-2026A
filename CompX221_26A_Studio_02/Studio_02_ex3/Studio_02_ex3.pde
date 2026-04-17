ArrayList<Button> buttonList = new ArrayList<Button>();

Button b1;

void setup()
{
  size(800, 800);
  rectMode(CENTER);

  buttonList.add(new Button(400, 400, 150, 50, #D66C6C));
  buttonList.add(new Button(400, 500, 150, 50, #4746B7));
  buttonList.add(new Button(400, 600, 150, 50, #83F539));
}

void draw()
{
  for (Button b : buttonList)
  {
    b.drawButton();
  }
}
