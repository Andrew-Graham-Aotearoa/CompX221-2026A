abstract class AbstractScreen
{
  protected ArrayList<String> _staticLabels;
  protected ArrayList<PVector> _labelPositions;
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
    _staticLabels = new ArrayList<String>();
    _labelPositions = new ArrayList<PVector>();

    
  }

  public void setStaffName(String staffName)
  {
    _staffName = staffName;
  }

  public void draw()
  {
    //Logotype
    image(_logo, 25, 25, 181, 36);

    //Header Section
    textSize(16);
    textAlign(LEFT);
    fill(0);
    //rect display week
    text("Week Starting:", 390, 55);
    stroke(#000000);
    rectMode(CORNER);
    fill(#D9D9D9);
    rect(492, 30, 150, 40);
    fill(0);
    text(WEEK_DISPLAY, 500, 55);
    //office location
    text("Office:" + " "+ _office, 666, 55);
    //staff display
    fill(#D9D9D9);
    rect(745, 30, 150, 40);
    fill(0);
    text(_staffName, 755, 55);

    for (int i = 0; i < _staticLabels.size(); i++)
    {
      
      text(_staticLabels.get(i), _labelPositions.get(i).x, _labelPositions.get(i).y);
    }
  }

  public void mousePressed(int x, int y)
  {
  }
  
  public void loadGridLabels()
  {
    String[] days = {"Mon", "Tue", "Wed", "Thu", "Fri"};
    for (int i = 0; i < 5; i++)
    {
      _staticLabels.add(days[i]);
      _labelPositions.add(new PVector(_GRID_START_X +5 + (i * _CELLWIDTH), 125));
    }
    
     String[] times = {"08:00 - 09:00", "09:00 - 10:00", "10:00 - 11:00", "11:00 - 12:00", "12:00 - 13:00",
                       "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00","17:00 - 18:00"};
    for (int i = 0; i < 10; i++)
    {
      _staticLabels.add(times[i]);
      _labelPositions.add(new PVector(90, _GRID_START_Y+ 35 + (i * _CELLHEIGHT)));
    }
  }
  
   protected void drawColorKeys()
   {
      fill(#CDE6C6);
      rectMode(CENTER);
      rect(1197, 280,  115, 50);
      fill(0);
      text("Available",1170, 285);
      
      fill(#FFE2C1);
      rectMode(CENTER);
      rect(1197, 225,  115, 50);
      fill(0);
      text("Flexible",1170, 225);
      
      fill(#F8B6B7);
      rectMode(CENTER);
      rect(1197, 170,  115, 50);
      fill(0);
      text("Unavailable",1160, 170);
      
      text("Colour Key", 1147,135);
   }
    

}
