ArrayList<Student> studentList = new ArrayList<Student>();
Student stu;

void setup()
{
  studentList.add(new Student(1234, "Bob", "Home", false));
  studentList.add(new Student(12345, "Bill", "Away", false));
  studentList.add(new Student(2345, "Jill", "Somewhere", true));


  //Create a Loop to look at all the contents of the ArrayList part 7
  //for( Student std: studentList)
  //{
  //  println(std.toString());
  //}

  //Display each student's name and if they have paid their fees
  for (int i = 0; i < studentList.size(); i++ )
  {
   Student s = studentList.get(i);
   println(s.getname() + " - " + s.getfeesPaid());
  }
}

void draw()
{
}
