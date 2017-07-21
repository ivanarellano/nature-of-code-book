import java.util.Random;

final class Exercise {
  
  Walker walker = new Walker(320, 240);
  Random generator = new Random();
  
  // An array to keep track of how often random numbers are picked
  float[] randomCounts = new float[20];
  
  // Ex1_7: Perlin space offsets
  float xOff = 0;
  float yOff = 10000;

  void update() {
    // Squiggly line that follows the mouse
    //ex1_3();
    
    // Colorful, random circles
    //ex1_4();
    
    // Bar chart with montecarlo distribution
    //ex1_6();
    
    // Perlin noise walker
    ex1_7();
  }
  
  void display() {
    walker.display();
  }
  
  void ex1_3() {
    float r = random(1);
    if (r < 0.5) {
      walker.stepToDirection(mouseX, mouseY);
    } else {
      walker.randomStep();
    }
  }
  
  void ex1_4() {
    float r = (float) generator.nextGaussian();
    float g = (float) generator.nextGaussian();
    float b = (float) generator.nextGaussian();
    
    float sd = width/4;
    float xMean = width/2;
    float yMean = height/2;
    
    r = constrain(r*sd + xMean, 0, 255);
    g = constrain(g*sd + xMean, 0, 255);
    b = constrain(b*sd + xMean, 0, 255);
    
    float xLoc = (float) generator.nextGaussian();
    float yLoc = (float) generator.nextGaussian();
    
    float x = sd * xLoc + xMean;
    float y = sd * yLoc + yMean;
    
    noStroke();
    fill(r,g,b);//fill(255, 30);
    ellipse(x, y, 16, 16);
  }
  
  void ex1_6() {
    int index = int(montecarlo() * randomCounts.length);
    randomCounts[index]++;
    
    stroke(0);
    strokeWeight(2);
    fill(127);
    
    int w = width/randomCounts.length;
    
    for (int x = 0; x < randomCounts.length; x++) {
      rect(x*w, height-randomCounts[x], w-1, randomCounts[x]);
    }
  }
  
  void ex1_7() {
    int x = int(map(noise(xOff), 0,1, 0,width));
    int y = int(map(noise(yOff), 0,1, 0,height));
    
    walker.loc.x = x;
    walker.loc.y = y;
    
    xOff += 0.01;
    yOff += 0.01;
  }
  
  // Chance of moving right: 40%
  void walkMostlyRight() {
    int x = 0;
    int y = 0;
    float r = random(1);
    
    if (r < 0.4) {
      x++;
    } else if (r < 0.6) {
      x--;
    } else if (r < 0.8) {
      y++;
    } else {
      y--;
    }
    
    walker.step(x, y);
  }
  
  float montecarlo() {
    int counter = 0; // prevent infinite loops
    
    while (counter < 10000) {
      float r1 = random(1);
      float probability = r1;
      float r2 = random(1);
  
      if (r2 < probability) {
        return r1;
      }
      counter++;
    }
    
    return 0;
  }
}