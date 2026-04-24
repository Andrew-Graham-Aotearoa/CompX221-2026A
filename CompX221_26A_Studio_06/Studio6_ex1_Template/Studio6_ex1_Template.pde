ArrayList<Student> studentList = new ArrayList<Student>();
void setup()
{
  //Student s1 = new Student(100, "Bob", "5A", "Hillcrest Road", "Hillcrest", "Hamilton");
  //Student s2 = new Student(200, "Mary", "10", "Te Huia Drive", "Flagstaff", "Hamilton");
  //Student s3 = new Student(300, "Jess", "20", "Knighton Road", "Hillcrest", "Hamilton");

  //Load all lines from the file to the array
  String[] lineArray = loadStrings("students.txt");

    //For Each string in the array
    for(String s : lineArray)
    {
      //Split the csv data in the line
      String[] csvArray = split(s, ',');
    
      //set and extract at the same time (creating a new student object)
      studentList.add(new Student(parseInt(csvArray[0]),
        csvArray[1],
        csvArray[2],
        csvArray[3],
        csvArray[4],
        csvArray[5]));
    }
  




  //s1.setPaidFees(true);
  //println(s1.toString());

  //change the housenumber using the set method
  //s1.setHouseNum("33");
  //s1.setStreetName("somewhere");

  //studentList.add(s1);
  //studentList.add(s2);
  //studentList.add(s3);

  for (Student s : studentList)
  {
    println(s.toString());
  }

  //for(Student s: studentList)
  //{
  //  println(s.getName() + " " + s.getPaidFees());
  //}
   
   for (Student s : studentList)
   {
    println(s.getSuburb()); 
   }
  
}
