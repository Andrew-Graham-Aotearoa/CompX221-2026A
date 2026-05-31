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


  public void draw()
  {
  }

  public void mousePressed(int x, int y)
  {
  }
}
