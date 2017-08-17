final class Walker {
  
  public PVector loc;

  Walker(int width, int height) {
    loc = new PVector(width / 2, height / 2);
  }
  
  void display() {
    //stroke(0);
    point(loc.x, loc.y);
    //ellipse(loc.x,loc.y,16,16);
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
  
  void stepToDirection(int x, int y) {
    if (loc.x < x) {
      loc.x++;
    } else if (loc.x > x) {
      loc.x--;
    }
    
    if (loc.y < y) {
      loc.y++;
    } else if (loc.y > y) {
      loc.y--;
    }
  }
}