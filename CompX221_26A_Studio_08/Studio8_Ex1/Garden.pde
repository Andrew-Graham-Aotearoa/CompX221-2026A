class Garden
{
  private ArrayList<GardenObject> _gardenList;
  private GardenObject _selectedObject;

  public Garden()
  {
    _gardenList = new ArrayList<GardenObject>();
    _selectedObject = null;
  }

  public void addPlant(int x, int y, int size, color pColor)
  {
    _gardenList.add(new Plant(x, y, size, pColor));
  }

  public void addBench(int x, int y, int bWidth, int bHeight, color bColor)
  {
    _gardenList.add(new Bench(x, y, bWidth, bHeight, bColor));
  }

  public void drawGarden()
  {
    for (GardenObject g : _gardenList)
    {
      g.drawObject();
    }
  }

  public void handleClick(int x, int y)
  {
    //    IF an object has not been selected THEN
    if (_selectedObject == null)
    {
      //FOR each object in the garden
      for (GardenObject g : _gardenList)
      {
        //IF current object has been clicked on THEN
        if (g.isClicked(x, y ) == true)
        {
          //Make the selected object the current object
          _selectedObject = g;
        }
      }
    } else
    {
      //Move the selected object to the new position
      _selectedObject.moveObject(x, y);
      //Deselect the selected object
      _selectedObject.deselectObject();
      //Make the selected object null
      _selectedObject = null;
    }
  }
  
  
  //growGarden cannot access growPlant() directly
  //Create an instance and Cast the Plant into the Garden Object
  
  public void growGarden()
  {
   for (GardenObject g : _gardenList)
    {
       if(g instanceof Plant)
       {
        Plant p = (Plant) g;
        p.growPlant();
      }
     
    }
  }
  
}

 
