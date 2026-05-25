//StudentMarks s1;
//StudentMarks s2;
DataSet d1;
DataSet d2;
DataSet selectedDataSet;


void setup()
{
  size(800, 600);
  //Create student mark objects and print their data to the console window
  //s1 = new StudentMarks("85858", 90, 70, #FF0000);
  //s2 = new StudentMarks("657", 50, 85, #FF0000);
  //println(s1);
  //println(s2);
  
  //Create two data set objects and display each data set to the console window
  d1 = new DataSet("101-17b.csv", #7433DE);
  d1.displayDataSet();
  //Display the average internal and exam mark
  println("Average internal mark: " + d1.getAverageInternal());
  println("Average exam mark: " + d1.getAverageExam());
  
  d2 = new DataSet("101-17a.csv", #ED3258);
  d2.displayDataSet();
  //Display the average internal and exam mark
  println("Average internal mark: " + d2.getAverageInternal());
  println("Average exam mark: " + d2.getAverageExam());
  
  //Set the selected data set to null as not data set is initially selected
  selectedDataSet = null;
  
}

void draw()
{
  background(255);
  //Plot the two student mark objects
  //s1.plotMark();
  //s2.plotMark();
  
  //If a dataset has been selected then plot it
  if (selectedDataSet != null)
  {
    selectedDataSet.plotDataSet(); 
  }
}



void keyPressed()
{
  //Set the data set to be plotted based on which key is pressed
  if (key == '1')
  {
    selectedDataSet = d1; 
  }
  else if (key == '2')
  {
    selectedDataSet = d2; 
  }
}
