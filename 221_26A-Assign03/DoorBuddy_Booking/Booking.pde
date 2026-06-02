class Booking
{
  private String _name;
  private int _id;
  private String _course;
  private String _note;
  private Float _bookRef;
  private int _duration;
  private String _email;

  public Booking(String name, int id, String course, String note, Float bookRef, int duration, String email)
  {
    _name = name;
    _id = id;
    _course = course;
    _note = note;
    _bookRef = bookRef;
    _duration = duration;
    _email = email;
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

//This method would send a notification to an email address.
  public void sendNotification()
  {
    println(_bookRef+" "+"Notification sent to:"+" "+_name+" "+_email);
  }

}
