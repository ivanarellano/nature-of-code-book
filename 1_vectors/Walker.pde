final class Walker {
  
  private PVector loc;

  Walker() {
    loc = new PVector(width/2, height/2);
  }
  
  void display() {
    stroke(0);
    point(loc.x, loc.y);
  }
  
  void step(int x, int y) {
    loc.x += x;
    loc.y += y;
  }
    
  void randomStep() {
    int x = int(random(3))-1; // -1-1
    int y = int(random(3))-1;
    step(x, y);
  }
}