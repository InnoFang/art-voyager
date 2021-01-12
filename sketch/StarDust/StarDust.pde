final int PARTICLES_QUANTITY = 20000;

float[] positionX = new float[PARTICLES_QUANTITY];
float[] positionY = new float[PARTICLES_QUANTITY];
float[] velocityX = new float[PARTICLES_QUANTITY];
float[] velocityY = new float[PARTICLES_QUANTITY];

void setup() {
  size(800, 800);
  stroke(64, 255, 255);
  for (int i = 0; i < PARTICLES_QUANTITY; ++ i) {
      positionX[i] = random(0, width);
      positionY[i] = random(0, height);
      velocityX[i] = 0;
      velocityY[i] = 0;
  }

  // set the location of top left corner of screen
  positionX[0] = 0;
  positionY[0] = 0;
}

void draw() {
  background(0, 128);
  // the particle velocity varies with the mouse position to positionX[0] and positionY[0]
  velocityX[0] = velocityX[0] * 0.5 + (mouseX - positionX[0]) * 0.1;
  velocityY[0] = velocityY[0] * 0.5 + (mouseY - positionY[0]) * 0.1;

  // calculate the first particle position
  positionX[0] += velocityX[0];
  positionY[0] += velocityY[0];

  // then calculate the remaining particle
  for (int i = 1; i < PARTICLES_QUANTITY; ++ i) {
    // Use the Pythagorean theorem to calculate the distance between the remaining particles 
    // and the first particle
    float whatever = 1024 / (sq(positionX[0] - positionX[i]) + sq(positionY[0] - positionY[i]));

    // and reduce the distance by a certain ratio.
    velocityX[i] = velocityX[i] * 0.95 + (velocityX[0] - velocityX[i]) * whatever;
    velocityY[i] = velocityY[i] * 0.95 + (velocityY[0] - velocityY[i]) * whatever;

    positionX[i] += velocityX[i];
    positionY[i] += velocityY[i];

    // check edge, if any position of particle out of screen, reverse its velocity 
    if ((positionX[i] < 0 && velocityX[i] < 0) 
    || (positionX[i] > width && velocityX[i] > 0)) {
        velocityX[i] = -velocityX[i];
    }
    if ((positionY[i] < 0 && velocityY[i] < 0) 
    || (positionY[i] > height && velocityY[i] > 0)) {
        velocityY[i] = -velocityY[i];
    }
    // draw the particles
    point(positionX[i], positionY[i]);
  }
}

void mousePressed() {
  // re-initial the particles
  for (int i = 1; i < PARTICLES_QUANTITY; ++ i) {
    positionX[i] = random(0, width);
    positionY[i] = random(0, height);
  }
}
