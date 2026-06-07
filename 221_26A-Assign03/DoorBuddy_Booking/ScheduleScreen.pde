class ScheduleScreen extends AbstractScreen
{
  private ArrayList<TimeSlot> _timeSlots;
  private TimeSlot _selectedSlot;
  private Button _unavailableButton;
  private Button _flexibleButton;
  private Button _availableButton;
  private Button _saveButton;
  private Button _homeButton;
  private Boolean _showHome;

  public ScheduleScreen(ArrayList<TimeSlot> timeSlots, String staffName, String office)
  {
    super(staffName, office);
    _timeSlots = timeSlots;
    _selectedSlot = null;
    _showHome = false;
    _unavailableButton = new Button(1197, 170, color(248, 182, 183), 115, 50, "UNAVAILABLE");
    _flexibleButton = new Button(1197, 225, color(255, 226, 193), 115, 50, "FLEXIBLE");
    _availableButton = new Button(1197, 280, color(205, 230, 198), 115, 50, "AVAILABLE");
    _saveButton = new Button(1197, 357, color(200, 228, 251), 115, 50, "SAVE");
    _homeButton = new Button(1197, 617, color(116, 195, 118), 115, 50, "HOME");

    loadGridLabels();
  }

  public Boolean getShowHome()
  {
    return  _showHome;
  }
  
  public void resetShowHome()
  {
   _showHome = false; 
  }

  public void draw()
  {
    //logo draw, header section
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
    //show buttons
    _saveButton.drawButton();
    _homeButton.drawButton();
    _unavailableButton.drawButton();
    _flexibleButton.drawButton();
    _availableButton.drawButton();
  }

  public void mousePressed(int x, int y)
  {


    int clickCol = (x - _GRID_START_X) / _CELLWIDTH;
    int clickRow = (y - _GRID_START_Y) / _CELLHEIGHT;

    // if selected slot + available clicked

    if (clickCol >= 0 && clickCol <= 4 && clickRow >= 0 && clickRow <= 9)
    {
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

    _availableButton.isClicked(x, y);
    _flexibleButton.isClicked(x, y);
    _unavailableButton.isClicked(x, y);

    if (_selectedSlot != null && _saveButton.isClicked(x, y)
      && (_availableButton.getIsSelected()
      || _flexibleButton.getIsSelected()
      || _unavailableButton.getIsSelected()))
    {
      

      //debug
      //println(_selectedSlot.getTitleCode());

      for (Booking b : _selectedSlot.getBookings())
      {
        if (_availableButton.getIsSelected()) b.sendNotification(true, _staffName, _selectedSlot.getDay());
        if (_unavailableButton.getIsSelected()) b.sendNotification(false, _staffName, _selectedSlot.getDay());
      }
      if (_availableButton.getIsSelected())
      {
        _selectedSlot.setTitleCode("Ava");
      }
      if (_flexibleButton.getIsSelected()) _selectedSlot.setTitleCode("May");
      if (_unavailableButton.getIsSelected())
      {
        _selectedSlot.setTitleCode("Una");
        _selectedSlot.getBookings().clear();
      }
      _unavailableButton.deselectObject();
      _flexibleButton.deselectObject();
      _availableButton.deselectObject();
      _selectedSlot.setIsSelected(false);
      _saveButton.deselectObject();
      _selectedSlot = null;
    }
    if (_homeButton.isClicked(x, y))
    {
      _showHome = true;
    }
  }
}
