final int PARTICLES_QUANTITY = 5000;

float[] positionX = new float[PARTICLES_QUANTITY];
float[] positionY = new float[PARTICLES_QUANTITY];
float[] velocityX = new float[PARTICLES_QUANTITY];
float[] velocityY = new float[PARTICLES_QUANTITY];
float[] m = new float[PARTICLES_QUANTITY];

void setup() {
  size(800, 800);
  stroke(64, 255, 255);
  fill(30, 15);
  for (int i = 0; i < PARTICLES_QUANTITY; ++ i) {
      m[i] = randomGaussian() * 16;
      positionX[i] = random(width);
      positionY[i] = random(height);
      velocityX[i] = 0;
      velocityY[i] = 0;
  }
}

void draw() {
   noStroke(); 
   rect(0, 0, width, height);
 
   for (int i = 0; i < PARTICLES_QUANTITY; ++ i) {
      float dx = mouseX - positionX[i];
      float dy = mouseY - positionY[i];
      // Use Pythagorean theorem to calculate the distance
      // between the particle and the mouse
      float d = sqrt(dx * dx + dy * dy);
      
      if (d < 1) d = 1;
      
      float f = sin(d * 0.04) * m[i] / d;
      // calculate the corresponding velocity according to
      // the distance between the particle and the mouse,
      // and add half of the origin velocity
      velocityX[i] = velocityX[i] * 0.5 + f * dx;
      velocityY[i] = velocityY[i] * 0.5 + f * dy;
      
      positionX[i] += velocityX[i];
      positionY[i] += velocityY[i];
      
      // check edge
      if (positionX[i] < 0) positionX[i] = width;
      else if (positionX[i] > width) positionX[i] = 0;
      
      if (positionY[i] < 0) positionY[i] = height;
      else if (positionY[i] > height) positionY[i] = 0;
      
      if (m[i] < 0) stroke(128, 128, 255);
      else stroke(0, 255, 255);
      
      // draw the particle
      point(positionX[i], positionY[i]);
   }
}

void mousePressed() {
   for (int i = 0; i < PARTICLES_QUANTITY; ++ i) {
      m[i] = randomGaussian() * 16;
      positionX[i] = random(width);
      positionY[i] = random(height);
   }
}
