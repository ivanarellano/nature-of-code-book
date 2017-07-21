Example example = new Example();
Exercise exercise = new Exercise();

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  
  //example.showCircleBounce();
  //example.showWalker();
  //example.ex1_3();
  //example.ex1_4();
  
  exercise.ex1_8();
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