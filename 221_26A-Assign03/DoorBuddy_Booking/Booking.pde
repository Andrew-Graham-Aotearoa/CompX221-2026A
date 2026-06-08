class Booking
{
  private String _name;
  private int _id;
  private String _course;
  private String _note;
  private Float _bookRef;
  private int _duration;
  private String _email;
  private String _timeSegment;
  private String _confirmed;

  public Booking(String name,
    int id,
    String course,
    String note,
    Float bookRef,
    int duration,
    String email,
    String timeSegment,
    String confirmed)
  {
    _name = name;
    _id = id;
    _course = course;
    _note = note;
    _bookRef = bookRef;
    _duration = duration;
    _email = email;
    _timeSegment = timeSegment;
    _confirmed = confirmed;
  }


  public String getName()
  {
    return _name;
  }

  public String getCourse()
  {
    return _course;
  }

  public String getNote()
  {
    return _note;
  }

  public Float getBookRef()
  {
    return _bookRef;
  }

  public int getDuration()
  {
    return _duration;
  }

  public int getId()
  {
    return _id;
  }

  public String getEmail()
  {
    return _email;
  }

  public String getTimeSegment()
  {
    return _timeSegment;
  }

  public String getConfirmed()
  {
    return _confirmed;
  }

  public void setConfirmed(String confirmed)
  {
    _confirmed = confirmed;
  }



  public String toString()
  {
    return "Appointment Booking Made: "
      + _name + " | " + _email + " | " + _timeSegment +" | " + _note;
  }

  public void sendNotification(boolean accepted, String staffName, String day)
  {
    if (accepted)
    {
      println(staffName + " Has approved your Booking: " + day + " " + toString());
    } else {
      println(staffName + " is unavailable for your Booking: " + day + " " + toString());
    }
  }

  public void sendNotification(String staffName, String day)
  {
    println("New booking request for " + staffName + ": " + day + " " + toString());
  }
}
