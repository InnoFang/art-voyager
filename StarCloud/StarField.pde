class StarField {
  
  final float STAR_COUNT = width * 2 / 3;
  
  final int MAX_SPEED = 11;
  final int MIN_SPEED = 1;
  final int SPEED_STEP = 1;
  int speed;
  
  PVector endpoint;  // vanishing point is used to control the perspective
  ArrayList<Star> stars;
  
  StarField() {
     // set the initial vanishing point
     // at the beginning of the mouse
     endpoint = new PVector(mouseX, mouseY);
     
     // initialize all of the Stars
     stars = new ArrayList();
     for ( int i = 0; i < STAR_COUNT; ++ i ) {
        stars.add(new Star()); 
     }
     
     speed = (MAX_SPEED + MIN_SPEED) / 2;
  }
  
  void run() {
      for (Star star: stars) {
         // The coordinate transformation of Stars
         // is used to obtain the coordinate of Stars in 
         // the Screen Coordinate System for the rendering 
         // of the stars afterward.
         star.transform(endpoint);
         
         // Cut for the stars out of the scree, 
         // and create new stars in the meanwhile,
         // which can make the stars appear continuously
         star.checkEdge();
         
         // Rendering the star and display it
         star.display();
         
         star.move(speed);
      }
  }
  
  void speedUp() {
     speed += SPEED_STEP;
     speed = constrain(speed, MIN_SPEED, MAX_SPEED);
  }
  
  void speedDown() {
     speed -= SPEED_STEP;
     speed = constrain(speed, MIN_SPEED, MAX_SPEED);
  }
  
  void updateEndpoint(float x, float y) {
     endpoint.x = x;
     endpoint.y = y;
  }
}
