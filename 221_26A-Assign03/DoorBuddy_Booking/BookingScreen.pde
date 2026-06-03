class BookingScreen extends AbstractScreen
{
  private TimeSlot _timeSlot;
  private ControlP5 _cp5;
  private String _bookName;
  private String _bookEmail;
  private String _bookCourse;
  private String _bookNote;

  private Button _submitButton;
  private Button _cancelButton;
  private Boolean _bookingComplete;
  private Boolean _isCanceled;

  public BookingScreen(ControlP5 cp5, TimeSlot timeSlot, String staffName, String office)
  {
    super(staffName, office);
    _timeSlot = timeSlot;
    _cp5 = cp5;

    //bookName
    _cp5.addTextfield("bookingName")
      .setPosition(580, 280)
      .setSize(400, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");


    //bookEmail
    _cp5.addTextfield("bookingEmail")
      .setPosition(580, 340)
      .setSize(400, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");

    //bookCourse
    _cp5.addTextfield("bookingCourse")
      .setPosition(580, 400)
      .setSize(400, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");

    //bookNote
    _cp5.addTextfield("BookingNote")
      .setPosition(580, 460)
      .setSize(400, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");
    
    _cancelButton = new Button(1197, 607, color(248, 182, 183), 115, 50, "CANCEL");
    _submitButton = new Button(1197, 672, color(116, 195, 118), 115, 50, "SUBMIT");
    
  }

  public void draw()
  {
    //logo draw, header section
    super.draw();
    textSize(16);

    //Input Field labels
    fill(0);
    textAlign(RIGHT);
    text("NAME:", 550, 305);

    fill(0);
    textAlign(RIGHT);
    text("EMAIL:", 550, 365);

    fill(0);
    textAlign(RIGHT);
    text("COURSE:", 550, 425);

    fill(0);
    textAlign(RIGHT);
    text("MESSAGE:", 550, 485);
    
    _submitButton.drawButton();
    _cancelButton.drawButton();
  }

  public void mousePressed(int x, int y)
  {
  }
}
