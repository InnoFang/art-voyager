class Star {
  final float MAX_DEPTH = width / 2;
  final float MAX_DIAM = 16;
  final float SCALE = MAX_DEPTH;
  
  PVector worldPosition;
  PVector viewPosition;
  PVector screenPosition;
  
  float diam;
  
  Star() {
    // Randomly generate a point in the
    // World Coordinate System
    worldPosition = new PVector(
      random(0, width),
      random(0, height),
      random(0, MAX_DEPTH)
    );
  }
  
  void transform(PVector endpoint) {
    // Transform the coordinates of stars from the World Coodinate System
    // into the Vanishing Coordinate System
    //viewPosition.x = (worldPosition.x - endpoint.x) / worldPosition.z * SCALE;
    //viewPosition.y = (worldPosition.y - endpoint.y) / worldPosition.z * SCALE;
    // The above code is equivalent to the follow one:
     viewPosition = PVector.sub(worldPosition, endpoint).div(worldPosition.z).mult(SCALE);
    
    
    // Transform the coordinates of stars from the Vanishing Coordinate System
    // into the Screen Coordinate System
    //screenPosition.x = endpoint.x + viewPosition.x;
    //screenPosition.y = endpoint.y + viewPosition.y;
    // the above code is equivalent to the follow one:
     screenPosition = PVector.add(endpoint, viewPosition);
    
    
    // Determine the diameter of a star according to the size of world coordinate Z
    // The smaller Z is, the closer it is to the screen, the bigger the stars are
    diam = map(worldPosition.z, 0, MAX_DEPTH, MAX_DIAM, 0);
  }
  
  void checkEdge() {
    if (screenPosition.x <= 0 ||
        screenPosition.x >= width ||
        screenPosition.y <= 0 ||
        screenPosition.y >= height) {
      
         // if the star is out of the scree, cut it out
         // and generate a new Star in the StarField randomly.
         worldPosition.set(
           random(0, width),
           random(0, height),
           MAX_DEPTH);
    }
  }
  
  void move(float speed) {
    worldPosition.z -= speed;
    
    // constrain the position of star in case of it run out of the screen
    worldPosition.z = constrain(worldPosition.z, 0, MAX_DEPTH);
  }
  
  void display() {
     float noiseScale = 0.02;
     float noiseValue = noise(screenPosition.x * noiseScale, screenPosition.y * noiseScale);
     fill(noiseValue * 255);
     noStroke();
     ellipse(screenPosition.x, screenPosition.y, diam, diam);
  }
}
