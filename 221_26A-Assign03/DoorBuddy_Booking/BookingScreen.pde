class BookingScreen extends AbstractScreen
{
  private TimeSlot _timeSlots;
  private ControlP5 _cp5;
  private String _bookName;
  private String _bookEmail;
  private String _bookCourse;
  private String _bookNote;
  
  private Button _submitButton;
  private Button _cancelButton;
  private Boolean _bookingComplete;
  private Boolean _isCanceled;

  public BookingScreen(TimeSlot timeSlots, String staffName, String office)
  {
    super(staffName, office);
    _timeSlots = timeSlots;
    
    
    //bookName
     _cp5.addTextfield("bookingName")
      .setPosition(580, 280)
      .setSize(200, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");
      
      //bookEmail
       _cp5.addTextfield("bookingEmail")
      .setPosition(580, 280)
      .setSize(200, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");
      
     //bookCourse
      _cp5.addTextfield("bookingCourse")
      .setPosition(580, 280)
      .setSize(200, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");
      
      //bookNote
       _cp5.addTextfield("BookingNote")
      .setPosition(580, 280)
      .setSize(200, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");
  }

  public void draw()
  {
    //logo draw, header section
    super.draw();
    textSize(16);
  }

  public void mousePressed(int x, int y)
  {
  }
}
