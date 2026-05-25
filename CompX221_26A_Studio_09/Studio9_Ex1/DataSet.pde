class DataSet
{
  private color _dataSetColor;
  private ArrayList<StudentMarks> _marksList;

  //constructor loading a csv

  public DataSet(String filename, color dataSetColor)
  {
    String id = "";
    int internal = 0;
    int exam = 0;

    _marksList = new ArrayList<StudentMarks>();
    _dataSetColor = dataSetColor;

    String[] lineArray = loadStrings(filename);
    for (String l : lineArray)
    {
      String[] csvArray = split(l, ',');
      id = csvArray[0];
      internal = parseInt(csvArray[1]);
      exam = parseInt(csvArray[2]);

      _marksList.add(new StudentMarks(id, internal, exam, _dataSetColor));
    }
  }
  
  
  public void displayDataSet()
  {
    for(StudentMarks m : _marksList)
    {
    println(m);  
    }
  }
  
  public void plotDataSet()
  {
   noStroke();
   for(StudentMarks m : _marksList)
   {
    m.plotMark(); 
   }
  }
  
  public int getAverageInternal()
  {
    int totalInternal = 0;
    
    for(StudentMarks m : _marksList)
   {
    totalInternal += m.getInternal();
    
   }
   return totalInternal/ _marksList.size();
  }
  
    public int getAverageExam()
  {
    int totalExam = 0;
    
    for(StudentMarks m : _marksList)
   {
    totalExam += m.getExam();
    
   }
   return totalExam/ _marksList.size();
  }
  
}
