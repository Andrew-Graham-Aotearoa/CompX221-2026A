class BookingScreen extends AbstractScreen
{
  private TimeSlot _timeSlot;
  private ControlP5 _cp5;
  private int _selectedSegment;
  private String _errorMessageName;
  private String _errorMessageEmail;
  private String _errorMessageTime;
  private Button _submitButton;
  private Button _cancelButton;
  private Boolean _bookingComplete;
  private long _completionTime;
  private Boolean _isCanceled;

  public BookingScreen(ControlP5 cp5, TimeSlot timeSlot, String staffName, String office)
  {
    super(staffName, office);
    _timeSlot = timeSlot;
    _cp5 = cp5;
    _isCanceled = false;
    _bookingComplete = false;
    _selectedSegment = -1;
    _errorMessageName = "";
    _errorMessageEmail = "";
    _errorMessageTime = "";
    _completionTime = 0;

    _cp5.remove("bookingName");
    _cp5.remove("bookingEmail");
    _cp5.remove("bookingCourse");
    _cp5.remove("bookingNote");

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
    _cp5.addTextfield("bookingNote")
      .setPosition(580, 460)
      .setSize(400, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText("");

    _cancelButton = new Button(1197, 607, color(248, 182, 183), 115, 50, "HOME");
    _submitButton = new Button(1197, 672, color(116, 195, 118), 115, 50, "SUBMIT");
  }

  public void hideInputBoxes()
  {
    _cp5.getController("bookingName").hide();
    _cp5.getController("bookingEmail").hide();
    _cp5.getController("bookingCourse").hide();
    _cp5.getController("bookingNote").hide();
  }

  public String getBookingName()
  {
    return _cp5.get(Textfield.class, "bookingName").getText();
  }

  public String getBookingEmail()
  {
    return _cp5.get(Textfield.class, "bookingEmail").getText();
  }

  public String getBookingCourse()
  {
    return _cp5.get(Textfield.class, "bookingCourse").getText();
  }

  public String getBookingNote()
  {
    return _cp5.get(Textfield.class, "bookingNote").getText();
  }

  public Boolean getIsCanceled()
  {
    return _isCanceled;
  }

  public Boolean getBookingComplete()
  {
    return _bookingComplete;
  }

  public long getCompletionTime()
  {
    return _completionTime;
  }


  public void draw()
  {
    //logo draw, header section
    super.draw();
    drawColorKeys();
    textSize(16);
    //println(_timeSlot);

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

    //Booking Display Information
    //note: would be better to refactor this into a loop
    String displayLocation;
    if (_timeSlot == null)
    {
      displayLocation = "";
    } else if (_timeSlot.getRoomNo() != null && !_timeSlot.getRoomNo().isEmpty())
    {
      displayLocation = _timeSlot.getRoomNo();
    } else
    {
      displayLocation = _office;
    }

    if (_timeSlot != null)
    {
      //println(_timeSlot);

      textSize(16);
      textAlign(LEFT);
      fill(0);

      //Display Selected WeekDay
      text("Selected Day", 215, 185);
      stroke(#000000);
      rectMode(CORNER);
      fill(#D9D9D9);
      rect(215, 200, 150, 40);
      fill(0);
      text(_timeSlot.getDay(), 265, 225 );


      //Header Display (Column)
      text("Selected Time", 215, 275);
      stroke(#000000);

      //Header Display (Staff Approved)
      text("Staff Approved", 379, 275);

      //Display TimeSegment "00"*************************************************
      if (isUnavailable())
      {
        fill(#F8B6B7);
      } else {
        if (_timeSlot.isSegmentBooked((_timeSlot.getTime()/100) + ":00"))
        {
          fill(#F8B6B7);
        } else {
          fill(#CDE6C6);
        }
      }

      //time "00"
      rect(215, 280, 150, 40);
      //location "00"
      rect(60, 280, 150, 40);
      fill(0);


      //field display
      text((_timeSlot.getTime() / 100) + ":00", 265, 305);

      //Display if Timeslot is Confirmed for "00"
      String confirmed = _timeSlot.getConfirmedForSegment((_timeSlot.getTime() / 100) + ":00");
      if (confirmed.equals("Y"))
      {
        text("Confirmed", 379, 305);
      } else if (confirmed.equals("N"))
      {
        text("Not Confirmed", 379, 305);
      }



      //header Location label (row)
      text("Location", 60, 275);

      //Location "00"
      stroke(#000000);
      rectMode(CORNER);
      fill(0);
      text(displayLocation, 110, 305 );
      if (_selectedSegment == 0)
      {
        stroke(#74C376);
        strokeWeight(3);
        noFill();
        rect(60, 280, 305, 40);
        strokeWeight(1);
        stroke(#000000);
      }

      //Display TimeSegment "15"*************************************************
      stroke(#000000);
      rectMode(CORNER);
      if (isUnavailable())
      {
        fill(#F8B6B7);
      } else {
        if (_timeSlot.isSegmentBooked((_timeSlot.getTime()/100) + ":15"))
        {
          fill(#F8B6B7);
        } else {
          fill(#CDE6C6);
        }
      }
      rect(215, 325, 150, 40);
      rect(60, 325, 150, 40);
      fill(0);
      //field display
      text((_timeSlot.getTime() / 100) + ":15", 265, 350);
      //selected
      if (_selectedSegment == 1)
      {
        stroke(#74C376);
        strokeWeight(3);
        noFill();
        rect(60, 325, 305, 40);
        strokeWeight(1);
        stroke(#000000);
      }
      String confirmed15 = _timeSlot.getConfirmedForSegment((_timeSlot.getTime() / 100) + ":15");
      if (confirmed15.equals("Y"))
      {
        text("Confirmed", 379, 350);
      } else if (confirmed15.equals("N"))
      {
        text("Not Confirmed", 379, 350);
      }

      //Location "15" (Row)
      stroke(#000000);
      rectMode(CORNER);
      fill(0);
      text(displayLocation, 110, 350 );


      //Display TimeSegment "30"**************************************************
      stroke(#000000);
      rectMode(CORNER);
      if (isUnavailable())
      {
        fill(#F8B6B7);
      } else {
        if (_timeSlot.isSegmentBooked((_timeSlot.getTime()/100) + ":30"))
        {
          fill(#F8B6B7);
        } else {
          fill(#CDE6C6);
        }
      }
      rect(215, 370, 150, 40);
      rect(60, 370, 150, 40);
      fill(0);
      //field display
      text((_timeSlot.getTime() / 100) + ":30", 265, 395);

      //Location "30"
      stroke(#000000);
      rectMode(CORNER);
      fill(0);
      text(displayLocation, 110, 395 );
      if (_selectedSegment == 2)
      {
        stroke(#74C376);
        strokeWeight(3);
        noFill();
        rect(60, 370, 305, 40);
        strokeWeight(1);
        stroke(#000000);
      }

      String confirmed30 = _timeSlot.getConfirmedForSegment((_timeSlot.getTime() / 100) + ":30");
      if (confirmed30.equals("Y"))
      {
        text("Confirmed", 379, 395);
      } else if (confirmed30.equals("N"))
      {
        text("Not Confirmed", 379, 395);
      }

      //Display TimeSegment "45"********************************************
      stroke(#000000);
      rectMode(CORNER);
      if (isUnavailable())
      {
        fill(#F8B6B7);
      } else {
        if (_timeSlot.isSegmentBooked((_timeSlot.getTime()/100) + ":45"))
        {
          fill(#F8B6B7);
        } else {
          fill(#CDE6C6);
        }
      }
      rect(215, 415, 150, 40);
      rect(60, 415, 150, 40);
      fill(0);
      //field display
      text((_timeSlot.getTime() / 100) + ":45", 265, 440);

      //Location "45"
      stroke(#000000);
      rectMode(CORNER);
      fill(0);
      text(displayLocation, 110, 440 );
      if (_selectedSegment == 3)
      {
        stroke(#74C376);
        strokeWeight(3);
        noFill();
        rect(60, 415, 305, 40);
        strokeWeight(1);
        stroke(#000000);
      }

      String confirmed45 = _timeSlot.getConfirmedForSegment((_timeSlot.getTime() / 100) + ":45");
      if (confirmed45.equals("Y"))
      {
        text("Confirmed", 379, 440);
      } else if (confirmed45.equals("N"))
      {
        text("Not Confirmed", 379, 440);
      }
    }
    _submitButton.drawButton();
    _cancelButton.drawButton();

    textAlign(LEFT);
    textSize(24);
    fill(#D35353);
    text(_errorMessageName, 985, 310);
    text(_errorMessageEmail, 985, 370);
    text(_errorMessageTime, 216, 500);

    if (_bookingComplete)
    {
      fill(0);
      textSize(36);
      text("Submission \n Successful!", 700, 450, 200, 250 );
    }
  }

  public void mousePressed(int x, int y)
  {
    _errorMessageName = "";
    _errorMessageEmail = "";
    _errorMessageTime = "";

    if (_cancelButton.isClicked(x, y))
    {
      _isCanceled = true;
      hideInputBoxes();
    }

    if (!isUnavailable())
    {
      //Manual Selection of a timeslot
      //"00"
      if (x > 60 && x < 365 && y > 280 && y < 320)
      {
        if (_selectedSegment == 0)
        {
          _selectedSegment = -1;
        } else {
          _selectedSegment = 0;
        }
      }
      //"15min"
      if (x > 60 && x < 365 && y > 325 && y < 365)
      {
        if (_selectedSegment == 1)
        {
          _selectedSegment = -1;
        } else {
          _selectedSegment = 1;
        }
      }
      //"30min"
      if (x > 60 && x < 365 && y > 370 && y < 410)
      {
        if (_selectedSegment == 2)
        {
          _selectedSegment = -1;
        } else {
          _selectedSegment = 2;
        }
      }
      //"45min"
      if (x > 60 && x < 365 && y > 415 && y < 455)
      {
        if (_selectedSegment == 3)
        {
          _selectedSegment = -1;
        } else {
          _selectedSegment = 3;
        }
      }
    }

    if (_submitButton.isClicked(x, y))
    {
      String name = getBookingName();
      String email = getBookingEmail();
      String course = getBookingCourse();
      String note = getBookingNote();
      String[] minutes = {":00", ":15", ":30", ":45"};
      _errorMessageName = "";
      _errorMessageEmail = "";
      _errorMessageTime = "";

      if (name.isEmpty())
      {
        _errorMessageName = "ENTER A NAME";
      }
      if (email.isEmpty())
      {
        _errorMessageEmail = "ENTER AN EMAIL";
      }
      if (_timeSlot != null && _selectedSegment == -1)
      {
        _errorMessageTime = "SELECT A TIME";
      }
      if (_errorMessageName.isEmpty()
        && _errorMessageEmail.isEmpty()
        && _errorMessageTime.isEmpty())
      {
        if (_timeSlot != null)
        {
          String segment = (_timeSlot.getTime()/100) + minutes[_selectedSegment];
          Booking booking =
            new Booking(name, 0, course, note, 0.0, _timeSlot.getDuration(), email, segment, "");
          _timeSlot.addBooking(booking);
          booking.sendNotification(_staffName, _timeSlot.getDay());
        } else {
          //message only, no booking time.
          Booking booking =
            new Booking(name, 0, course, note, 0.0, 0, email, "", "");
          booking.sendNotification(_staffName, "");
        }
        //_submitButton.deselectObject();
        _bookingComplete = true;
        hideInputBoxes();
        _completionTime = millis();
      }
    }
  }

  private Boolean isUnavailable()
  {
    if (_timeSlot == null) return false;
    return _timeSlot.colorCode() == #F8B6B7;
  }
}
