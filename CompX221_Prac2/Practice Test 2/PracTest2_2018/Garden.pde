class Garden
{
  private ArrayList<AbstractObject> _objectList;

  public Garden()
  {
    _objectList = new ArrayList<AbstractObject>();
    
  }
  
  public void addPlant(int x, int y, color pColor, int size, String name)
  {
    _objectList.add(new Plant (x, y, pColor, size, name));
  }
  
  public void addFeature(int x, int y, color fColor, int wdth, int lgth)
  {
    _objectList.add(new Feature(x, y, fColor, wdth, lgth));
  }
  
   public void drawGarden()
  {
    for (AbstractObject g : _objectList)
    {
      g.drawObject();
    }
  }
  
   public void growGarden(int amount)
  {
   for (AbstractObject g : _objectList)
    {
       if(g instanceof Plant)
       {
        Plant p = (Plant) g;
        p.growPlant(amount);
      }
     
    }
  }
  
}
