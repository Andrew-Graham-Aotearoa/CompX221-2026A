ArrayList<Student> studentList = new ArrayList<Student>();
Student stu;

void setup()
{
  Student s1 = new Student(1234, "Bob", "Home", "123456");
  Student s2 = new Student(12345, "Bill", "Away", "234567");
  Student s3 = new Student(2345, "Jill", "Somewhere", "456789");
  International i1 = new International(4321, "Jing", "Overseas",
                      "2222000","L2345", "Student", "30/12/25"); 
  International i2 = new International(43331, "Gill", "Overseas",
                      "2552000","L2445", "Student", "30/12/25");
  
  //(int id, String name, String address, String phone,
  //  String pNumber, String visaType, String visaExpiry)
  
  studentList.add(s1);
  studentList.add(s2);
  studentList.add(s3);
  
  //we can add the subclass items to the superclass list
  studentList.add(i1);
  studentList.add(i2);

  println(i1);
  println(i1.getExpiry());
  
  
  
  //Create a Loop to look at all the contents of the ArrayList
  //has to be the superclass identifier, (but cannot look at the 
  //unique subclass items with this particular loop)
  for( Student std: studentList)
  {
    println(std.toString());
  }

}

void draw()
{
}
