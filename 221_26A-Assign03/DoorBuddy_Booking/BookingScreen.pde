class BookingScreen extends AbstractScreen
{
 private TimeSlot _timeSlot;
  
  
  
 public BookingScreen(TimeSlot _timeSlot, String staffName, String office)
 {
 super(staffName, office);
 loadGridLabels();
 }

  public void show()
  {
  }

  public void hide()
  {
  }


  public void draw()
  {
    //logo draw, header section
    super.draw();
  }

  public void mousePressed(int x, int y)
  {
  }
  
}
