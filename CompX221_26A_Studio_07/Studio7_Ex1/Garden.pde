class Garden
{
  //to implement an aggregation we need to create an
  //array list to store objects

  private ArrayList<Plant> _plantList;

  //in this case there is nothing passed into the constructor
  public Garden()
  {
    //this creates the new arraylist object
    _plantList = new ArrayList<Plant>();
  }
  public void addPlant(int x, int y, int size, color pColor)
    {
    //Two ways-
    
    //1) create a plant object and then add to the ArrayList
    //Plant p = new Plant(x, y, size, pColor);
    //_plantList.add(p);
    
    //2) all in one
    _plantList.add(new Plant(x, y, size, pColor));
    }
    
    public void drawGarden()
    {
     //for loop
     
     //for (int i = 0; i < _plantList.size(); i++)
     //{
     //  _plantList.get(i).drawPlant();
     //}
     
     //for each loop
     for(Plant p: _plantList)
     p.drawPlant();
    }
    
    public void growGarden()
    {
      //we need to make sure the list is not empty
      //(otherwise Grow will cause an error)
      if(_plantList.size() > 0)
      {
     int index = (int)random(_plantList.size()); 
     _plantList.get(index).growPlant();
      }
    }
    
}
