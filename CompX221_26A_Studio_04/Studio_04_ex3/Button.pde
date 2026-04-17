abstract class Button 
{
  //fields
 protected PVector _center;
 protected color _buttonColor;
 
 //constructor
 public Button (int x, int y, color buttonColor)
 {
  _center =  new PVector(x, y);
  _buttonColor = buttonColor;
 }
  
  //abstract methods - each button is drawn in a different way
  public abstract void drawButton();
  public abstract boolean isClicked(int x, int y);
  
}
