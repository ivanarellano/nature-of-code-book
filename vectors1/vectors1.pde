Example example = new Example();
Exercise exercise = new Exercise();

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  
  example.display();
  exercise.display();
}

void keyPressed() {  
  if (key == CODED) {
    if (keyCode == UP) {
      exercise.pressedUp();
    } else if (keyCode == DOWN) {
      exercise.pressedDown();
    }
    
    if (keyCode == LEFT) {
      exercise.pressedLeft();
    } else if (keyCode == RIGHT) {
      exercise.pressedRight();
    }
  }
}

void mousePressed() {
  exercise.accTo(mouseX,mouseY);
}