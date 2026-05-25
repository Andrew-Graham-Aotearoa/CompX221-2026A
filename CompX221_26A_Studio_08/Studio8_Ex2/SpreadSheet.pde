class SpreadSheet
{
  private final int _CELL_WIDTH;
  private final int _CELL_HEIGHT;
  private final int _INTIAL_TEXT_SIZE;
  private int _numColumns;
  private int _numRows;
  private ArrayList<AbstractCell> _cellList;

  public SpreadSheet( int numColumns, int numRows)
  {
    _numColumns = numColumns;
    _numRows = numRows;
    _CELL_WIDTH = 300;
    _CELL_HEIGHT = 100;
    _INTIAL_TEXT_SIZE = 50;
    _cellList = new ArrayList<AbstractCell>();
  }

  private boolean checkPosition(int col, int row)
  {
    if (col >= 0 && col <= _numColumns-1 && row >= 0 && row <= _numRows-1)
    {
      return true;
    } else
      return false;
  }

  public void addTextCell(int col, int row, String text)
  {
    if (checkPosition(col, row) == true)
    {
      _cellList.add
        (new TextCell(col*(_CELL_WIDTH), row *(_CELL_HEIGHT),
        _CELL_WIDTH, _CELL_HEIGHT, _INTIAL_TEXT_SIZE, text));
    } else
    {
      println("not a valid text cell input");
    }
  }

  public void addNumericCell(int col, int row, float value, int numDP)
  {
    if (checkPosition(col, row) == true)
    {
      _cellList.add
        (new NumericCell(col * (_CELL_WIDTH), row * (_CELL_HEIGHT),
        _CELL_WIDTH, _CELL_HEIGHT, _INTIAL_TEXT_SIZE, value, numDP));
    } else
    {
      println("not a valid numeric cell input");
    }
  }

  public void drawSpreadSheet()
  {
    for (AbstractCell c : _cellList)
    {
      c.drawCell();
    }
  }

  public void changeTextSize(int amount)
  {
    for (AbstractCell c : _cellList)
    {
      c.changeTextSize(amount);
    }
  }

  public void loadFile(String filename)
  {
    String[] load = loadStrings(filename);
    String[] list;

    for (String items : load)
    {
      list = split(items, ",");

      int col;
      int row;
      String s;
      float val;
      int dp;

      if (list.length == 3)
      {
        col = Integer.parseInt(list[0]);
        row = Integer.parseInt(list[1]);
        s = list[2];
        addTextCell(col, row, s);
      }

      if (list.length == 4)
      {
        col = Integer.parseInt(list[0]);
        row = Integer.parseInt(list[1]);
        val = Float.parseFloat(list[2]);
        dp= Integer.parseInt(list[3]);
        addNumericCell(col, row, val, dp);
      }
    }
  }
}
