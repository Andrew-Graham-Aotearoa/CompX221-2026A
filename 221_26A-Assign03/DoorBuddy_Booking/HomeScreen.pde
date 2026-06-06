class HomeScreen extends AbstractScreen
{
  private ArrayList<TimeSlot> _timeSlots;
  private TimeSlot _selectedSlot;
  private Boolean _showLogin;
  private Boolean _showBooking;
  private Button _staffButton;
  private Button _submitButton;
  //private Button _cancelButton;

  public HomeScreen(ArrayList<TimeSlot> timeSlots, String staffName, String office)
  {
    super(staffName, office);
    _timeSlots = timeSlots;
    _selectedSlot = null;
    _showLogin = false;
    _showBooking = false;
    _staffButton = new Button(1197, 357, color(200, 228, 251), 115, 50, "STAFF");
    //_cancelButton = new Button(1197, 607, color(248, 182, 183), 115, 50, "CANCEL");
    _submitButton = new Button(1197, 672, color(116, 195, 118), 115, 50, "SELECT");

    //Draw labels
    loadGridLabels();
  }

  public Boolean getShowLogin()
  {
    return _showLogin;
  }

  public void resetShowLogin()
  {
    _showLogin = false;
  }

  public void resetButtons()
  {
    _submitButton.deselectObject();
    _staffButton.deselectObject();
  }

  public Boolean getShowBooking()
  {
    return _showBooking;
  }

  public void resetShowBooking()
  {
    _showBooking = false;
  }

  public TimeSlot getSelectedSlot()
  {
    return _selectedSlot;
  }


  //Investigate later: set the display week to current week.
 

  public void draw()
  {
    //logo draw, header section, Color Keys
    super.draw();
    drawColorKeys();

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

      //Draw Cells Add Text
      if (slot.getRoomNo() != null && !slot.getRoomNo().isEmpty())
      {
        fill(0);
        text(slot.getRoomNo(), cellX, cellY + 15 );
       
      }
      if (slot.getCourseCode() != null && !slot.getCourseCode().isEmpty())
      {
        text(slot.getCourseCode(), cellX, cellY +30 );
      }

      //Draw Unavailable Time notification Segment
      int count = slot.getBookingCount();
      if (count > 0)
      {
        fill(#F8B6B7);
        rectMode(CORNER);
        rect(cellX, cellY + _CELLHEIGHT - (14 * count), _CELLWIDTH, 14 * count);
        fill(0);
        textSize(12);
        text(" " + count + "  Booking", cellX + 2, cellY + _CELLHEIGHT - 4);
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
    //Draw buttons
    _staffButton.drawButton();
    _submitButton.drawButton();
    
    fill(0);
    textAlign(LEFT);
    textSize(14);
    text("Booking: Time + Select",1122, 612 );
    text("Message: Select only",1122, 633 );
    
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
    } else {
      if (_selectedSlot != null && !_submitButton.isClicked(x, y) && !_staffButton.isClicked(x, y))
      {
        _selectedSlot.setIsSelected(false);
        _selectedSlot = null;
      }
    }
    if (_staffButton.isClicked(x, y))
    {
      _showLogin = true;
    }
    if (_submitButton.isClicked(x, y))
    {
      _showBooking = true;
    }
  }
}
