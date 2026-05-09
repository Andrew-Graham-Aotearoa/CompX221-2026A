class Wave
{
  private ArrayList<TeddyBear> _bearList;

private int _numBears;

//constructor set num bears + create arrayList
  public Wave (int numBears)
  {
    _numBears = numBears;
    //define a new arrayList of TeddyBears
    _bearList = new ArrayList<TeddyBear>();
    //Populate it starting at 0,0
    _bearList.add(new TeddyBear(0, 0));
    
    //Populate the ArrayList with TeddyBear(s)
     for(int i = 1; i < _numBears; i++)
    {
     _bearList.add(new TeddyBear((_bearList.get(0).getWidth()*i), 0));
    }
  }
  
  public void drawWave()
  {
    
    for (TeddyBear b: _bearList)
    {
    b.drawBear();
    }
    
    //add TeddyBears to Draw
    //TeddyBear t = new TeddyBear(x, y);
    //_bearList.add(t);
    
    //for(int i = 0; i <= _numBears; i++)
    //{
      
     //_bearList.get(i).drawBear();
     //_bearList.get(i).moveBear();
    //loop with these as if they were variables
    
    //}
    
    //for each to draw
    //int x , int y (start) = /(center.x + _img.width) (_center.y+ 100)
    
  
  //shift using getWidth() to add more bears to the loop
    
  }

  public void moveWave(int amount)
  {
     for (TeddyBear b: _bearList)
    {
    b.moveBear(amount);
    }
  }
}
