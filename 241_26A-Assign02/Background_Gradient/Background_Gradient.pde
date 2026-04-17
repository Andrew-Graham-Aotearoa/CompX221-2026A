void setup() {
  size(1280, 720);
}

void draw() 

{
  // Background Gradient
  color top = color(9, 92, 142); // Mid Blue
  color bottom = color(14, 48, 72); // Deep Blue
  setGradient(0, 0, width, height, top, bottom);
}
//Background Gradient
void setGradient(int x, int y, float w, float h, color c1, color c2) {
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i); 
  }
}
