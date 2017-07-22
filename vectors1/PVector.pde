/*
  + add() — add vectors
  + sub() — subtract vectors
  + mult() — scale the vector with multiplication
  + div() — scale the vector with division
  + mag() — calculate the magnitude of a vector
  setMag() - set the magnitude of a vector
  + normalize() — normalize the vector to a unit length of 1
  + limit() — limit the magnitude of a vector
  heading() — the 2D heading of a vector expressed as an angle
  rotate() — rotate a 2D vector by an angle
  lerp() — linear interpolate to another vector
  dist() — the Euclidean distance between two vectors (considered as points)
  angleBetween() — find the angle between two vectors
  dot() — the dot product of two vectors
  cross() — the cross product of two vectors (only relevant in three dimensions)
  random2D() - make a random 2D vector
  random3D() - make a random 3D vector
*/

//final class PVector {

//  public float x;
//  public float y;
  
//  /*
//  The commutative rule: u→+v→=v→+u→
//  The associative rule: u→+(v→+w→)=(u→+v→)+w→
//  */
  
//  PVector() {
//    x = 0;
//    y = 0;
//  }

//  PVector(float x_, float y_) {
//    x = x_;
//    y = y_;
//  }

//  public void add(PVector v) {
//    x += v.x;
//    y += v.y;
//  }
  
//  public void sub(PVector v) {
//    x -= v.x;
//    y -= v.y;
//  }
  
//  /*
//  The associative rule: (n*m)*v→=n*(m*v→)
//  The distributive rule with 2 scalars, 1 vector: (n*m)*v→=n*v→+m*v→
//  The distributive rule with 2 vectors, 1 scalar: (u→+v→)*n=u→*n+v→*n
//  */
  
//  public void mult(float n) {
//    x *= n;
//    y *= n;
//  }
  
//  public void div(float n) {
//    x /= n;
//    y /= n;
//  }
  
//  public float mag() {
//    return sqrt(x*x + y*y);
//  }
  
//  public void setMag(float n) {
//    normalize();
//    mult(n);
//  }
  
//  public void normalize() {
//    float m = mag();
//    if (m != 0) {
//      div(m);
//    }
//  }
  
//  public void limit(float max) {
//    if (mag() > max) {
//      normalize();
//      mult(max);
//    }
//  }
//}