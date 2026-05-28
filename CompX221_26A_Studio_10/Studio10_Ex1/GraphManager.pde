class GraphManager
{
  private color[] _dataSetColor;
  private ArrayList <Button> _buttonList;
  private ArrayList <DataSet> _dataSetList;
  private int _bottom;

  public GraphManager(String folderPath, int bottom)
  {
    _buttonList = new ArrayList<Button>();
    _dataSetList = new ArrayList<DataSet>();
    _bottom = bottom;

    _dataSetColor = new color[] {#F08F8F, #8FF0DD, #C88FF0, #BDF08F};
    String[] filenames = getFileNames(folderPath);
    //println(filenames);
    for (int i = 0; i < filenames.length; i ++)
    {
      _dataSetList.add(new DataSet(filenames[i], _dataSetColor[i %_dataSetColor.length]));
      _buttonList.add(new Button(100 + i * (130), _bottom + 50,
        _dataSetColor[i %_dataSetColor.length], 100, 50,
        _dataSetList.get(i).getName() ));
    }
  }


  public void drawUI()
  {
    for (Button b : _buttonList)
    {
      b.drawButton();
    }
  }

  public int checkButtonClick(int x, int y)
  {
    for (Button  b : _buttonList)
    {
      b.deselectObject();
    }
    for (int i = 0; i < _buttonList.size(); i ++)
    {
      if (_buttonList.get(i).isClicked(x, y) == true)
      {
        return i;
      }
    }
    return -1;
  }


  private String[] getFileNames(String dir)
  {
    File[] files = new File(dir).listFiles();
    ArrayList<String> fileList = new ArrayList<String>();

    for (File f : files)
    {
      if (f.getName().endsWith(".csv"))
      {
        fileList.add(f.getName());
      }
    }
    return fileList.toArray(new String[0]);
  }


  public void plotDataSet(int index)
  {
    if (index >= 0 && index < _dataSetList.size())
    {
      _dataSetList.get(index).plotDataSet(_bottom);
    }
  }
}
