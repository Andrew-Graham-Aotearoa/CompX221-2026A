class Student
{
  //This is where class scope variables (fields) go.
  protected int _id;
  protected String _name;
  protected String _address;
  protected String _phone;

  public Student(int id, String name, String address, String phone)
  {
    //Set fields to the values passed in
    _id = id;
    _name = name;
    _address = address;
    _phone = phone;
  }

  //Check in the console if the data is valid
  public String toString()
  {
    return _id + " " + _name + " " + _address + " " + _phone;
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





  // code to get and set fees paid info
  //public String getfeesPaid()
  //{
  //  if (_feesPaid == false)
  //  {
  //    return ("Has not Paid");
  //  }
  //    return ("Has Paid");
  //}

  ////set method
  //public void setfeesPaid(Boolean feesPaid)
  //{
  //  _feesPaid = feesPaid;
  //}
}
