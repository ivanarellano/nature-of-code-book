final class Exercise {
  
  Mover mover = new Mover();
  Mover[] movers = new Mover[20];
  
  Exercise() {
    for (int i = 0; i < movers.length; i++) {
      movers[i] = new Mover();
    }
  }
  
  void display() {
    ex1_8_2();
  }
  
  void ex1_8() {
    accTo(mouseX,mouseY,mover);
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
  void ex1_8_2() {
    for (int i = 0; i < movers.length; i++) {
      Mover mov = movers[i];
      accTo(mouseX,mouseY,mov);
      mov.update();
      mov.checkEdges();
      mov.display();
    }
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
  
  void accTo(int x, int y, Mover mov) {
    PVector mouse = new PVector(x,y);
    PVector dir = PVector.sub(mouse, mov.loc);
    dir.normalize();
    dir.mult(0.25);
    mov.acc = dir;
  }
}