void setup()
{
  Bluray m1 = new Bluray("Serenty", "Science Fiction", 2005);
  Bluray m2 = new Bluray("Despiciable Me", "Comedy", 2010);
  
  //Call println to view m1 (using toString())
  println(m1.toString());
  
  //toString() is called by default, so you dont have to include it.
  println(m2);
  
  //Add name "Tim" to m1
  m1.setLentTo("Tim");
  println(m1);
  
  //view title only of an item
  println(m1.gettitle());
  
  
}

void draw()
{
  
}
