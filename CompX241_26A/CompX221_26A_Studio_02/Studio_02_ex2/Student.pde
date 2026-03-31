class Student
{
  //This is where class scope variables (fields) go.
  private int _id;
  private String _name;
  private String _address;
  private Boolean _feesPaid;

  public Student(int id, String name, String address, Boolean feesPaid)
  {
    //Set fields to the values passed in
    _id = id;
    _name = name;
    _address = address;
    _feesPaid = false;
  }

  //Check in the console if the data is valid
  public String toString()
  {
    return _id + " " + _name + " " + _address + " " + getfeesPaid();
  }


  //Get and Set methods for the fields
  public int getid()
  {
    return _id;
  }

  public String getname()
  {
    return _name;
  }

  public String getaddress()
  {
    return _address;
  }

  public String getfeesPaid()
  {
    if (_feesPaid == false)
    {
      return ("Has not Paid");
    }
      return ("Has Paid");
  }

  //set method
  public void setfeesPaid(Boolean feesPaid)
  {
    _feesPaid = feesPaid;
  }
}
