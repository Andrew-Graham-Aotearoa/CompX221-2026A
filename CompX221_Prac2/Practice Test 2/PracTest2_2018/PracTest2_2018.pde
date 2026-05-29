
//Name: 
//ID: 

//Objects for testing individual sub classes
//Plant p;
//Plant p2;
//Feature f;

//Object for the garden
Garden g;
void setup()
{
  size(800, 600);
  
  //Code creating individual sub class objects, uncomment as required and 
  //comment out again when testing the garden class
 //p = new Plant(50, 100, #AE72CE, 50, "Lily");
 //p2 = new Plant(250, 100, #CE72A0, 80, "Rose");
 //f = new Feature(200, 200, #8E82A0, 100, 20);
  
  //Create a new garden object
  g = new Garden();
  
  //call the method below to add all the plants and features to the garden
  createGarden();
}

void draw()
{
   background(255); 
   //Draw the individual sub class objects, uncomment as required and
   //comment out again when testing the garden class
  //p.drawObject();
  //p2.drawObject();
  //f.drawObject();
   
   //Draw the garden
   g.drawGarden();
}

void keyPressed()
{ 
  //Make the individual plant objects grow, uncomment as required and
  //comment out again when testing the garden class
 //p.growPlant(2);
 //p2.growPlant(2);
  
  //Make all plants in the garden grow
  g.growGarden(2);
}

/*
 *  This method will add all the plants and features to the garden.
 *
 *  Uncomment when you are ready to test your garden class
 *
 *  DO NOT MODIFY any of the code inside the method!!!!!!!!!!!!!!!!
 */

void createGarden()
{
  int x = 20;
  int y = height/2;
  //Add a pathway to the garden
  for (int i = 1; i <= 16; i++)
  {
     g.addFeature(x, y, #C6C6C6, 40, 40);
     x += 50;
  }
  //Add a water feature to the garden
  g.addFeature(width/2, 120, #716362, 50, 50);
  //Add plants around the water feature
  g.addPlant(width/2 - 70, 120, #CE72A0, 50, "Dahlia");
  g.addPlant(width/2, 50, #CE72A0, 50, "Dahlia");
  g.addPlant(width/2, 190, #CE72A0, 50, "Dahlia");
  g.addPlant(width/2 + 70, 120, #CE72A0, 50, "Dahlia");
  x = 40;
  y = 50;
  //Add some roses
  for (int i = 1; i <= 3; i++)
  {
    g.addPlant(x, y, #F5EA0C, 60, "Rose");
    y += 90;
  }
  //Add a bench
  g.addFeature(100, 140, #A8A7AA, 20, 200);
  //Add a Trampoline
  g.addFeature(width/2, 450, #7B11D3, 150, 150);
  //Add some trees
  g.addPlant(700, 400, #30AA31, 100, "Pohutakawa");
  g.addPlant(700, 530, #30AA31, 100, "Pohutakawa");
  g.addPlant(80, 400, #30AA31, 100, "Pohutakawa");
  g.addPlant(80, 530, #30AA31, 100, "Pohutakawa");
}
