ArrayList<Triangle> triangleList = new ArrayList<Triangle>();


Triangle t1;

void setup()
{
size(800, 600);
t1 = new Triangle(50, 100, 150, 200, 100, 100, #B047BF);
//println(t1);
triangleList.add(t1);
triangleList.add(new Triangle(150, 230, 400, 500, 300, 350,#A0FA53));
triangleList.add(new Triangle(550, 340, 200, 100, 650, 420, #03A0FF));
  for(int i =0; i < triangleList.size(); i++)
  {
   println(triangleList.get(i)); 
  }

}

void draw()
{
  //t1.drawTriangle();
  
  //draw using the original for loop
  // for(int i =0; i < triangleList.size(); i++)
  //{
  // triangleList.get(i).drawTriangle(); 
  //}
  
  
  //for each loop
  for(Triangle t: triangleList)
  {
    t.drawTriangle();
  }
  
  
}
