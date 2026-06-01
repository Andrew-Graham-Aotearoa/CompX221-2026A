class HomeScreen extends AbstractScreen
{
  private ArrayList<TimeSlot> _timeSlots;
  private TimeSlot _selectedSlot;
  private Boolean _showLogin;
  private Boolean _showBooking;
  private Button _setScheduleButton;
  private Button _submitButton;

  public HomeScreen(ArrayList<TimeSlot> timeSlots, String staffName, String office)
  {
    super(staffName, office);
    _timeSlots = timeSlots;
    _selectedSlot = null;
    _showLogin = false;
    _showBooking = false;
    _setScheduleButton = new Button(1197, 357, color(200, 228, 251), 115, 50, "SET SCHEDULE");
    _submitButton = new Button(1197, 617, color(116, 195, 118), 115, 50, "SUBMIT");
    loadGridLabels();
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
    //logo draw, header section\

    
      super.draw();
  

    //Timeslot grid Display
    for (TimeSlot slot : _timeSlots)
    {
      int col = dayToColumn(slot.getDay());
      int row = timeToRow(slot.getTime());

      if (col == -1 || row == -1) continue;

      int cellX = _GRID_START_X + (col * _CELLWIDTH);
      int cellY = _GRID_START_Y + (row * _CELLHEIGHT);

      fill(slot.colorCode());
      rectMode(CORNER);
      rect(cellX, cellY, _CELLWIDTH, _CELLHEIGHT);
     
      textSize(16);
      fill(0);

      if (slot.getRoomNo() != null && !slot.getRoomNo().isEmpty())
      {
        fill(0);
        text(slot.getRoomNo(), cellX, cellY + 15 );
        println(slot.getRoomNo());
        println(cellX + " " + cellY);
      }
      if (slot.getCourseCode() != null && !slot.getCourseCode().isEmpty())
      {
        text(slot.getCourseCode(), cellX, cellY +30 );
      }
    }
    //highlight display in Grid
    if (_selectedSlot != null)
    {
      //calculate cellX and cellY from _selectedSlot
      int col = dayToColumn(_selectedSlot.getDay());
      int row = timeToRow(_selectedSlot.getTime());
      int cellX = _GRID_START_X + (col * _CELLWIDTH);
      int cellY = _GRID_START_Y + (row * _CELLHEIGHT);
      // draw highlight rect
      stroke(#74C376);
      strokeWeight(3);
      noFill();
      rect(cellX, cellY, _CELLWIDTH, _CELLHEIGHT);
      strokeWeight(1);
      stroke(#000000);
    }
    //show buttons
    _setScheduleButton.drawButton();
    _submitButton.drawButton();
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

  public void mousePressed(int x, int y)
  {
    int clickCol = (x - _GRID_START_X) / _CELLWIDTH;
    int clickRow = (y - _GRID_START_Y) / _CELLHEIGHT;
    _setScheduleButton.deselectObject();
    _submitButton.deselectObject();
    if (clickCol >= 0 && clickCol <= 4 && clickRow >= 0 && clickRow <= 9)
    {
      if (_selectedSlot != null)
      {
        _selectedSlot.setIsSelected(false);
        _selectedSlot = null;
      }
      for (TimeSlot slot : _timeSlots)
      {
        int col = dayToColumn(slot.getDay());
        int row = timeToRow(slot.getTime());

        if (col == clickCol && row == clickRow)
        {
          _selectedSlot = slot;
          _selectedSlot.setIsSelected(true);
          break;
        }
      }
    }
    if (_setScheduleButton.isClicked(x, y))
    {
      _showLogin = true;
    }
    if (_submitButton.isClicked(x, y))
    {
      _showBooking = true;
    }
  }
}
