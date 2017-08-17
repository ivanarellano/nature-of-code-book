import java.util.Random;

final class Example {
  
  Random generator = new Random();
  
  // Ex1_6: Animate Perlin noise
  //int counter = 0;
  
  void display() {
     ex1_6();
  }
  
  // Creates normal distrubtion (Gaussion) of dots along x-axis
  void ex1_4() {
    float num = (float) generator.nextGaussian();
    float sd = width/6;
    float mean = width/2;
    
    float x = sd * num + mean;
    
    noStroke();
    fill(255, 10);
    ellipse(x, 180, 16, 16);
  }
  
  void ex1_6() {
    loadPixels();
    
    float xoff = 0.0;
    
    for (int x = 0; x < width; x++) {
      float yoff = 0.0;
    
      for (int y = 0; y < height; y++) {
        // Use xoff and yoff for noise().
        // For TV noise effect use random(255)
        //noiseDetail(8,0.65);
        // Add counter to noise() 3rd param to animate
        float bright = map(noise(xoff,yoff), 0,1, 100,255);
        
        //int a = x+y*sw;
        // Use x and y for pixel location.
        pixels[x+y*width] = color(bright);
        
        yoff += 0.1;
      }
      
      xoff += 0.1;
    }
    
    updatePixels();
    //counter++;
  }
  
  // Creates circles at the mouse position
  void first_intro() {
    if (mousePressed) {
      fill(0);
    } else {
      fill(255);
    }
    
    ellipse(mouseX, mouseY, 80, 80);
  }
}