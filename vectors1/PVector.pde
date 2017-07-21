final class PVector {

  public float x;
  public float y;
  
  /*
  The commutative rule: u→+v→=v→+u→
  The associative rule: u→+(v→+w→)=(u→+v→)+w→
  */
  
  PVector() {
    x = 0;
    y = 0;
  }

  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }

  public void add(PVector v) {
    x += v.x;
    y += v.y;
  }
  
  public void sub(PVector v) {
    x -= v.x;
    y -= v.y;
  }
  
  /*
  The associative rule: (n*m)*v→=n*(m*v→)
  The distributive rule with 2 scalars, 1 vector: (n*m)*v→=n*v→+m*v→
  The distributive rule with 2 vectors, 1 scalar: (u→+v→)*n=u→*n+v→*n
  */
  
  public void mult(float n) {
    x *= n;
    y *= n;
  }
  
  public void div(float n) {
    x /= n;
    y /= n;
  }
  
  public float mag() {
    return sqrt(x*x + y*y);
  }
  
  public void normalize() {
    float m = mag();
    if (m != 0) {
      div(m);
    }
  }
  
  public void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
}