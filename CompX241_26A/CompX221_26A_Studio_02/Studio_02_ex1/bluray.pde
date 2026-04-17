class Bluray
{
  //This is wheere class scope variables (fields) go.
  private String _title;
  private String _genre;
  private int _year;
  private String _lentTo;

  public Bluray(String title, String genre, int year)
  {
    //Set fields to the values passed in
    _title = title;
    _genre = genre;
    _year = year;
    _lentTo = "";
  }

  public String toString()
  {
    return _title + " " + _genre + " " + _year + " " + _lentTo;
  }


  //Get and Set methods for lentTo field
  public String getLentTo()
  {
    return _lentTo;
  }

  public void setLentTo(String name)
  {
    if (name == "")
    {
      println("Provide a name");
    }
     else 
     { 
    _lentTo = name;
     }
  }
  
  //get method for searching title
  public String gettitle()
  {
    return _title;
  }
  
}
