final class Exercise {
  
  Mover mover = new Mover();
  
  void display() {
    ex1_8();
  }
  
  void ex1_8() {
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
  void ex1_7() {
    PVector v = new PVector(1, 5);
    PVector u = PVector.mult(v, 5);
    PVector w = PVector.sub(v, u);
    v.div(3);
  }
  
  void pressedLeft() {
    mover.acc.x = -0.015;
  }
  
  void pressedRight() {
    mover.acc.x = 0.015;
  }
  
  void pressedUp() {
    mover.acc.y = -0.015;
  }
  
  void pressedDown() {
    mover.acc.y = 0.015;
  }
  
  void accTo(int x, int y) {
    PVector mouse = new PVector(x,y); //<>//
    PVector dir = PVector.sub(mouse, mover.loc);
    mover.acc = dir;
  }
}