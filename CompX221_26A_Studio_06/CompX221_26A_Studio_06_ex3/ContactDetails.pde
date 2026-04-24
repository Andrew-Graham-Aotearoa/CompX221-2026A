class ContactDetails
{
  private String _email;
  private String _phone;

  public ContactDetails(String email, String phone)
  {
    _email = email;
    _phone = phone;
  }
  
   public String toString()
  {
    return _email + " " + _phone; 
  }
  
  //get and set methods
  public String getEmail()
  {
    return _email;
  }
  public void setEmail(String email)
  {
    _email = email;
  }
  
  public String getPhone()
  {
    return _phone;
  }
  public void setPhone(String phone)
  {
    _phone = phone;
  }
}
