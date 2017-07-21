final class Exercise {
  
  Mover mover = new Mover();
  
  void ex1_8() {
    mover.update();
    mover.checkEdges();
    mover.display();
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
}