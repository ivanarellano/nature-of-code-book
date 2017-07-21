final class Example {
  
  PVector loc = new PVector(100, 100);
  PVector vel = new PVector(1, 3.3);
  Walker walker = new Walker();
  Mover mover = new Mover();
  
  void showCircleBounce() {
    loc.add(vel);
  
    if ((loc.x > width) || (loc.x < 0)) {
      vel.x *= -1;
    }
    if ((loc.y > height) || (loc.y < 0)) {
      vel.y *= -1;
    }
  
    stroke(0);
    fill(175);
  
    ellipse(loc.x, loc.y, 16, 16);
  }
  
  void showWalker() {
    walker.randomStep();
    walker.display();
  }
  
  void ex1_3() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector center = new PVector(width/2, height/2);
    
    mouse.sub(center);
    
    // ex1_5
    fill(0);
    rect(0, 0, mouse.mag(), 10);
    
    // ex1_6
    mouse.normalize();
    mouse.mult(50);
    
    // ex1_3
    translate(center.x, center.y);
    line(0, 0, mouse.x, mouse.y);
  }
  
  void ex1_4() {
    mover.update();
    mover.checkEdges();
    mover.display();
  }
}