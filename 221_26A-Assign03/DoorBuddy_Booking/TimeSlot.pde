class TimeSlot
{
  private String _staff;
  private String _courseCode;
  private String _roomNo;
  private Boolean _inPerson;
  private int _duration;
  private String _day;
  private int _time;
  private String _titleCode;
  private Boolean _isSelected;
  private ArrayList<Booking> _bookings;

  public TimeSlot(TableRow row, Table table)
  {
    _duration = -1;
    _isSelected = false;
    _bookings = new ArrayList<Booking>();

    loadSlotData(row, table);
    loadBookingData(row, table);
  }

  private void loadSlotData(TableRow row, Table table)
  {
    _staff = row.getString("Staff");
    _day = row.getString("Day");
    _time = row.getInt("Time");
    _titleCode = row.getString("Title");

    if (table.getColumnIndex("CourseCode") >= 0)
      _courseCode = row.getString("CourseCode");

    if (table.getColumnIndex("RoomNo") >= 0)
      _roomNo = row.getString("RoomNo");

    if (table.getColumnIndex("InPerson") >= 0)
      _inPerson = row.getString("InPerson").equals("Y");

    if (table.getColumnIndex("Duration") >= 0 && !row.getString("Duration").isEmpty())
    {
      _duration = row.getInt("Duration");
    }
  }


  //add confrirm field if the csv table changes        *****************************

  private void loadBookingData(TableRow row, Table table)
  {
    if (row.getString("BookRef") != null && !row.getString("BookRef").isEmpty())
    {
      Booking booking = new Booking(
        row.getString("Name"),
        row.getInt("Id"),
        row.getString("Course"),
        row.getString("Note"),
        row.getFloat("BookRef"),
        _duration,
        //email
        "",
        //timeSegment
        "00"
        );

      addBooking(booking);
    }
  }

  public Boolean addBooking(Booking booking)
  {
    if (_bookings.size() < 4)
    {
      _bookings.add(booking);
      return true;
    }

    return false;
  }

  public String getDay()
  {
    return _day;
  }

  public int getTime()
  {
    return _time;
  }

  public String getTitleCode()
  {
    return _titleCode;
  }

  public String getCourseCode()
  {
    return _courseCode;
  }

  public String getRoomNo()
  {
    return _roomNo;
  }

  public Boolean getInPerson()
  {
    return _inPerson;
  }

  public int getDuration()
  {
    return _duration;
  }

  public String getStaffName()
  {
    return _staff;
  }

  public void setIsSelected(Boolean selected)
  {
    _isSelected = selected;
  }

  public Boolean getIsSelected()
  {
    return _isSelected;
  }

  public int getBookingCount()
  {
    return _bookings.size();
  }

  public color colorCode()
  {
    String title = _titleCode;
    //unavailable
    if (title.equals("Cla") ||
      title.equals("Mmm") ||
      title.equals("Mst") ||
      title.equals("Msu") ||
      title.equals("Mae") ||
      title.equals("Res") ||
      title.equals("Una") ||
      title.equals("Lun") ||
      title.equals("Unc"))
    {
      return #F8B6B7;
    }
    //Maybe available
    if (title.equals("May") ||
      title.equals("Wfh"))
    {
      return #FFE2C1;
    }
    //Available
    if (title.equals("Ava")||
      title.equals("Ofh"))
    {
      return #CDE6C6;
    }

    return #D9D9D9;
  }

  public Boolean isSegmentBooked(String segment)
  {
    for (Booking b : _bookings)
    {
      if (b.getTimeSegment().equals(segment))
      {
        return true;
      }
    }
    return false;
  }
  
  public void draw()
  {
  }
}
