final class Mover {
  
  public PVector loc;
  public PVector vel;
  public PVector acc;
  public float topSpeed;
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = new PVector();
    acc = new PVector();
    topSpeed = 5;
  }
  
  Mover(PVector location, PVector velocity) {
    loc = location;
    vel = velocity;
  }
  
  void update() {
    //acc = PVector.random2D();
    //acc.mult(random(2));
    vel.add(acc);
    vel.limit(topSpeed);
    loc.add(vel);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, 64, 64);
  }
  
  void checkEdges() {
    // wrap around the screen
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
    
    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }
}