// have all the states and behaviors of stars   
StarField sf;
void setup() {
  size(800, 800);
  sf = new StarField();
}

void draw() {
   background(0);
   
   // run the Star Field
   // update status of Star and draw Star
   sf.run();
}

/* Use to change the velocity of Star */
void mousePressed() {
  if (mouseButton == LEFT) {
    sf.speedUp();
  } else if (mouseButton == RIGHT) {
    sf.speedDown(); 
  }
}

/* Use to change the perspective */
void mouseMoved() {
  sf.updateEndpoint(mouseX, mouseY);
}
