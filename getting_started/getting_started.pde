Example example = new Example();
Exercise exercise = new Exercise();

void setup() {
  size(320, 240);
}

void draw() {
  example.display();
  
  exercise.update();
  exercise.display();
}