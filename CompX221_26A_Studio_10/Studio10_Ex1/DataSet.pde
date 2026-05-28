class DataSet
{
  private color _dataSetColor;
  private String _name;
  private ArrayList<StudentMarks> _marksList;

  //constructor loading a csv

  public DataSet(String filename, color dataSetColor)
  {
    //variables to use
    String id = "";
    int internal = 0;
    int exam = 0;
    
    String[] name = split(filename, '.');
    _name = name[0];
    
    
    
    //create the arrayList
    _marksList = new ArrayList<StudentMarks>();
    //set color
    _dataSetColor = dataSetColor;

    //load the array
    String[] lineArray = loadStrings(filename);
    for (String l : lineArray)
    {
      
     // println(l);
      
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
  
  public void plotDataSet(int bottom)
  { 
   noStroke();
   for(StudentMarks m : _marksList)
   {
    m.plotMark(bottom); 
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
  
  public String getName()
  {
   return _name; 
  }
  
}
