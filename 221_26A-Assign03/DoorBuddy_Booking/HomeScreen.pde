class HomeScreen extends AbstractScreen
{
  private ArrayList<TimeSlot> _timeSlots;
  private TimeSlot _selectedSlot;
  private Boolean _showLogin;
  private Boolean _showBooking;
  private String _staffName;
  private String _office;
  private Button _setScheduleButton;
  private Button _submitButton;

  public HomeScreen(ArrayList<TimeSlot> timeSlots, String staffName, String office)
  {
    super();
    _timeSlots = timeSlots;
    _selectedSlot = null;
    _showLogin = false;
    _showBooking = false;
    _staffName = staffName;
    _office = office;

    _setScheduleButton = new Button(1139, 357, color(200, 228, 251), 115, 50, "SET SCHEDULE");
    _submitButton = new Button(1139, 617, color(116, 195, 118), 115, 50, "SUBMIT");
  }

  public Boolean getShowLogin()
  {
    return _showLogin;
  }

  public Boolean getShowBooking()
  {
    return _showBooking;
  }

  public TimeSlot getSelectedSlot()
  {
    return _selectedSlot;
  }

  public void hide()
  {
  }

  //Investigate later: set the display week to current week.
  //public String getDate()
  //{
  //  java.util.Calendar cal = java.util.Calendar.getInstance();
  //  int dayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK);

  //}

  public void draw()
  {
    //header sectioin
    //logo draw
    super.draw();

    textAlign(LEFT);
    text("Week Starting:", 355, 55);

    stroke(#000000);
    rectMode(CORNER);
    fill(#D9D9D9);

    rect(489, 30, 150, 50);
    text(WEEK_DISPLAY, 489, 55);

    text(_office, 661, 55);

    rect(736, 30, 150, 50);
    text(_staffName, 741, 55);

    //grid render
  }

  public int dayToColumn(String day)
  {
    if (day.equals("Mon"))
    {
      return 0;
    }
    if (day.equals("Tue"))
    {
      return 1;
    }
    if (day.equals("Wed"))
    {
      return 2;
    }
    if (day.equals("Thu"))
    {
      return 3;
    }
    if (day.equals("Fri"))
    {
      return 4;
    } else
      return -1;
  }

  public int timeToRow(int time)
  {
    int row = (time - 800) / 100;
    if (row < 0 || row > 9) return -1;
    return row;
  }

  //cellX = _GRID_START_X + (columnIndex * _CELLWIDTH)
  //cellY = _GRID_START_Y + (rowIndex * _CELLHEIGHT)

  public void mousePressed(int x, int y)
  {
  }
}
