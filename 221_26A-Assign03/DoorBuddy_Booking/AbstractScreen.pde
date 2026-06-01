abstract class AbstractScreen
{
  protected ArrayList<String> _staticLabels;
  protected ArrayList<Button> _buttons;
  public final int _CELLWIDTH = 184;
  public final int _CELLHEIGHT = 57;
  public final int _GRID_START_X = 13;
  public final int _GRID_START_Y = 80;
  public PImage _logo;
  public AbstractScreen()
  {
    _logo = loadImage("doorBuddyLogo.png");
  }

  public void show()
  {
  }

  public void hide()
  {
  }


  public void draw()
  {
    image(_logo, 20,20, 171, 34);
  }

  public void mousePressed(int x, int y)
  {
  }
}
