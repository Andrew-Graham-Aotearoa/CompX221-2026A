//create an array list and store the profile of people in the csv file
ArrayList<Profile> profileList = new ArrayList<Profile>();

void setup()
{
  String[] lineArray = loadStrings("profiles.csv");
  String[] csvArray;

  //For Each string in the array
  for (String items : lineArray)
  {
    //Split the csv data in the line
    csvArray = split(items, ',');

    //list of items
    String user;
    String nam;
    String hsnum;
    String stname;
    String subrb;
    String city;
    String email;
    String phone;

    if (csvArray.length == 8)
    {
      user = csvArray[0];
      nam = csvArray[1];
      hsnum = csvArray[2];
      stname = csvArray[3];
      subrb = csvArray[4];
      city = csvArray[5];
      email = csvArray[6];
      phone = csvArray[7];

      profileList.add(new Profile(user, nam, hsnum, stname, subrb, city, email, phone));
    }
  }
  for (Profile p : profileList)
  {
    println(p.toString());
  }
  
  for (Profile p : profileList)
  {
    println(p._name + " " + p.getEmail()); 
  }
  
}


void draw()
{
}
