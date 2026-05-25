/*
 *
 * DO NOT change the code on this tab!
 * However you may comment/uncomment lines so that you can test and run
 * your program as you go.
 *
 */


// Variable for a spreadsheet object
SpreadSheet sheet;

void setup()
{
  
  // Size the sketch 
  size(600,600);
    
  // Create the spreadsheet object to test the SpreadSheet class
  sheet = new SpreadSheet(2,6);
  
  //Testing code to test the spreadsheet class before adding the loadFile method
  //Add some text cells to the spreadsheet
  //sheet.addTextCell(0,0,"Name");
  //sheet.addTextCell(1,0,"Score");
  //sheet.addTextCell(0,1,"Thanos");
  //sheet.addTextCell(0,2,"Starlord");
  //sheet.addTextCell(0,3,"Thor");
  //sheet.addTextCell(0,4,"Rocket");
  //sheet.addTextCell(0,5,"AVERAGE");
    
  //Add some numeric cells to the spreadsheet
  //sheet.addNumericCell(1,1,45.67,1);
  //sheet.addNumericCell(1,2,12.82222,1);
  //sheet.addNumericCell(1,3,32.12345,2);
  //sheet.addNumericCell(1,4,13.0,2);
  //sheet.addNumericCell(1,5,20.723134,1);
    
  //Try and add some bad cells
  //sheet.addTextCell(-1,0,"Groot");
  //sheet.addTextCell(1,10,"Drax");
  //sheet.addNumericCell(15,1,45.67,1);
  //sheet.addNumericCell(1,-5,12.82222,1);
  
  //Load a csv file of cell information (comment out the previous testing code)
  sheet.loadFile("scores.csv");
  
  }


// Draw method
void draw()
{
  // White background
  background(255);
  
  sheet.drawSpreadSheet();
  
}

void keyPressed()
{
  int amount = 0;
  
  if (key == '+')
  {
     amount = 5;
  }
  else if(key == '-')
  {
    amount = -5; 
  }
  
  sheet.changeTextSize(amount);
}
