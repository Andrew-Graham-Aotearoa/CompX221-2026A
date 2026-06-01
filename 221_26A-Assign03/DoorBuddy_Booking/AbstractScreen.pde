abstract class AbstractScreen
{
  protected ArrayList<String> _staticLabels;
  protected ArrayList<Button> _buttons;
  protected String _staffName;
  protected String _office;
  protected PImage _logo;
  
  public final String WEEK_DISPLAY = "11/05/26";
  public final int _CELLWIDTH = 184;
  public final int _CELLHEIGHT = 57;
  public final int _GRID_START_X = 13+184;
  public final int _GRID_START_Y = 80+57;
  
  public AbstractScreen(String staffName, String office)
  {
    _logo = loadImage("doorBuddyLogo.png");
    _staffName = staffName;
    _office = office;
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
    
     //header 
    textAlign(LEFT);
    fill(0);
    text("Week Starting:", 400, 55);
    //rect display week
    stroke(#000000);
    rectMode(CORNER);
    fill(#D9D9D9);
    rect(489, 30, 150, 50);
    fill(0);
    text(WEEK_DISPLAY, 495, 55);
    //office location
    text("Office:" + " "+ _office, 666, 55);
    //staff display
    fill(#D9D9D9);
    rect(736, 30, 150, 50);
    fill(0);
    text(_staffName, 741, 55);
  }

  public void mousePressed(int x, int y)
  {
  }
}
