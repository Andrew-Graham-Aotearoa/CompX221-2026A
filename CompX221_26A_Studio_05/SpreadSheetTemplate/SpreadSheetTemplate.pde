ArrayList<AbstractCell> AbstractCellList = new ArrayList<AbstractCell>();

//Variables for testing the cell classes
//TextCell t1;
//NumericCell n1;

// Setup method
void setup()
{
  // Size the sketch (don't change)
  size(600, 600);

  String[] load = loadStrings("scores.csv");
  String[] list;

  for (String items : load)
  {
    list = split(items, ',');

    //list of items
    int x;
    int y;
    int wdth;
    int hgt;
    int txt;
    String name;
    float val;
    int numDP;


    if (list.length == 6)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      wdth = Integer.parseInt(list[2]);
      hgt = Integer.parseInt(list[3]);
      txt = Integer.parseInt(list[4]);
      name = list[5];
      //add a new TextCell object to the list
      AbstractCellList.add(new TextCell(x, y, wdth, hgt, txt, name));
    }

    if (list.length == 7)
    {
      x = Integer.parseInt(list[0]);
      y = Integer.parseInt(list[1]);
      wdth = Integer.parseInt(list[2]);
      hgt = Integer.parseInt(list[3]);
      txt = Integer.parseInt(list[4]);
      val = Float.parseFloat(list[5]);
      numDP = Integer.parseInt(list[6]);

      //add a new NumericCell object to the list
      AbstractCellList.add(new NumericCell(x, y, wdth, hgt, txt, val, numDP));
    }
    
  }


  //Create a new text cell object to test the TextCell class
  //t1 = new TextCell(200, 400,300, 100,50,"Name");

  //Create a new numeric cell object to test the NumericCell class
  //n1 = new NumericCell(50,50,300,100,50,13.0,2);
}

// Draw method
void draw()
{
  // White background
  background(255);
  for (AbstractCell c : AbstractCellList)
  {
    c.drawCell();
    
  }
  
  //Draw the text cell
  //t1.drawCell();

  //Draw the numeric cell
  //n1.drawCell();
}

//increases + decreases the point size of the font
void keyPressed()
{
  for (AbstractCell c : AbstractCellList)
  {
    if (key ==  '+')
    {
      //increase font size
      c.txtSize(5);
      
    }
    if (key == '-')
    {
      c.txtSize(-5);
    }
  }
  //redraw();
}
