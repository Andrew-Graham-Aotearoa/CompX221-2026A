class StudentMarks
{
  private final int _DOT_SIZE = 4;
  private final float _MAX_MARK = 100;
  private String _id;
  private int _internal;
  private int _exam;
  private color _dotColor;

  public StudentMarks(String id, int internal, int exam, color dotColor)
  {
    _id = id;
    _internal = internal;
    _exam = exam;
    _dotColor = dotColor;
  }

  public int getInternal()
  {
    return _internal;
  }

  public int getExam()
  {
    return _exam;
  }

  private String padRight(String input, int colWidth)
  {
    int length = input.length();
    int numSpaces = colWidth - length;
    for (int i = 1; i <= numSpaces; i++)
    {
      input += " ";
    }
    return input;
  }

  public void plotMark()
  {
    float x = (_internal/ _MAX_MARK) * width;
    float y = height -((_exam/_MAX_MARK) * height);

    fill(_dotColor);
    ellipseMode(CENTER);
    ellipse(x, y, _DOT_SIZE, _DOT_SIZE);
  }

  public String toString()
  {
    return padRight(_id, 10) + padRight((str(_internal)), 5) + padRight(str(_exam), 5);
  }
}
