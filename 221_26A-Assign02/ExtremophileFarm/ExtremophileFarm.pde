
void setup() {
  size(1280, 720);
  noStroke();
}

void draw()
{
  // Background and Gradient variables
  color top = color(9, 92, 142); // Mid Blue
  color bottom = color(14, 48, 72); // Deep Blue
  //Gradient area is defined outside of the UI area.
  //Simulation Area
  int hSim = 600;
  int wSim = 1072;
  int simX= 213;
  int simY = 128;
  setGradient(simX, simY, wSim, hSim, top, bottom);

  //border around Gradient + Simulation Area
  noFill();
  stroke(#000000);
  strokeWeight(5);
  rect( simX, simY, wSim, hSim );

  //Header and TopBar Nav
  int marginLeft = 36;
  fill(#000000);
  PFont h1;
  h1 = loadFont("Chicago12.1-48.vlw");
  textFont(h1, 62);
  text("EXTREMOPHILE FARM", marginLeft, 74);
}

//Background Gradient Method
void setGradient(int x, int y, float w, float h, color cTop, color cBm) {
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(cTop, cBm, inter);
    stroke(c);
    line(x, i, x+w, i);
  }
  //User Interface area (top and Sidebar)
  noStroke();
  fill(#095c8e);
  rect(0, 0, width, 128);
  rect(0, 128, 213, 600);
}
