class Profile
{
  private String _username;
  private String _name;

  //Address object
  private Address _address;
  
  //Contact Details object
  private ContactDetails _contactDetails;
  
  //constructor
  public Profile(String username, String name,
          String houseNum, String streetName, String suburb, String city,
          String email, String phone)
  {
    _username = username;
    _name = name;
    
    //Object from Address Class
    _address = new Address(houseNum, streetName, suburb, city);
    
    //from Contact Details Class (email, phone)
    _contactDetails = new ContactDetails(email, phone);
    
  }
  
  

  //get methods

  //Email
  public String getEmail()
  {
    return _contactDetails.getEmail();
  }

  //profile name
  public String getProfileName()
  {
   return _username; 
  }
  
//complete the toString method with address and contact details
  public String toString()
  {
    return _username + " " + _name + " " + _address + " " + _contactDetails;
  }
}
