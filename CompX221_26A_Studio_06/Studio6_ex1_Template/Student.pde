class Student
{
  private int _id;
  private String _name;
  private boolean _paidFees;
  
  //creates a new Reference Variable in the Student Object (to access fields in the Address class)
  private Address _address;
  
  public Student(int id, String name, String houseNum, String streetName,
  String suburb, String city)
  {
    _id = id;
    _name = name;
    //we need a new Object
    _address = new Address(houseNum, streetName, suburb, city);
    _paidFees = false;
  }
  
  public int getId()
  {
    return _id; 
  }
  
  public String getName()
  {
    return _name; 
  }
  
  public String getPaidFees()
  {
    if (_paidFees == true)
    {
      return "Has Paid"; 
    }
    else
    {
     return "Has not paid"; 
    }
  }
  
  public void setPaidFees(boolean paidFees)
  {
     _paidFees = paidFees;
  }
  
  //will return the whole address using the existing toString() method
  public String getAddress()
  {
   return _address.toString();
   
  }
  
  //we can access parameters in the _address field like so:
  public String getSuburb()
  {
   return _address.getSuburb(); 
  }
  
  public String toString()
  {
    return _id + " " + _name + " " + " " + getPaidFees() + " " + _address; 
  }
  
  //setters for setting fields using the address field
  public void setHouseNum(String houseNum)
  {
   _address.setHouseNum(houseNum); 
  }
  
  public void setStreetName(String streetName)
  {
   _address.setStreetName(streetName); 
  }
  
}
