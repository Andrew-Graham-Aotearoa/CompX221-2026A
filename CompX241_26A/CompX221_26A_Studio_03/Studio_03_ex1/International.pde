class International extends Student
{
  private String _pNumber;
  private String _visaType;
  private String _visaExpiry;

  public International
    (int id, String name, String address, String phone,
    String pNumber, String visaType, String visaExpiry)
  {
    //super passes the info from the superconstructor
    super(id, name, address, phone);
    _pNumber= pNumber;
    _visaType = visaType;
    _visaExpiry = visaExpiry;
  }
  
  
  //Original method with repeated code
  //public String toString()
  //{
    //in this method the code is repeated from the student class (not ideal)
  // return _id + " " + _name + " " + _address + " " + _phone
  // + " " + _pNumber + " " + _visaType + " " + _visaExpiry; 
  //}
  
    public String toString()
  {
   //call the superclass  toString method  
   return super.toString() +
   //specific code from the subclass
    " " + _pNumber + " " + _visaType + " " + _visaExpiry; 
  }
  
  public String getExpiry()
  {
    return _visaExpiry;
  }
  
  
}
