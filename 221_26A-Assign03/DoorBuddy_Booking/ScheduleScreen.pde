class ScheduleScreen extends AbstractScreen
{
 private ArrayList<TimeSlot> _timeSlots;
  private TimeSlot _selectedSlot;
  private Boolean _showLogin;
  private Boolean _showBooking;
  private Button _setScheduleButton;
  private Button _submitButton;
  
  
  public ScheduleScreen(ArrayList<TimeSlot> timeSlots, String staffName, String office)
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


  public void draw()
  {
    //logo draw, header section
    super.draw();  
    
    //Timeslot grid Display
    for (TimeSlot slot : _timeSlots)
    {
      int col = homeScreen.dayToColumn(slot.getDay());
      int row = homeScreen.timeToRow(slot.getTime());

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
        println(slot.getRoomNo());
        println(cellX + " " + cellY);
      }
      if (slot.getCourseCode() != null && !slot.getCourseCode().isEmpty())
      {
        text(slot.getCourseCode(), cellX, cellY +30 );
      }
      
      int count = slot.getBookingCount();
      if (count > 0)
      {
      fill(#F8B6B7);
      rectMode(CORNER);
      rect(cellX, cellY + _CELLHEIGHT-6,  (_CELLWIDTH/4) * slot.getBookingCount(), 6); 
      }
    }
    //highlight display in Grid
    if (_selectedSlot != null)
    {
      //calculate cellX and cellY from _selectedSlot
      int col = homeScreen.dayToColumn(_selectedSlot.getDay());
      int row = homeScreen.timeToRow(_selectedSlot.getTime());
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

  public void mousePressed(int x, int y)
  {
  }
  
  
}  
