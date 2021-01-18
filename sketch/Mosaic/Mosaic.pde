void setup() {
  size(600, 800);
  background(255);
  smooth(5);
  noStroke();
  render();
  save("demo.jpg");
}

void render() {
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j += 10) {
      fill( random(200, 255) );
      rect(i, j, 10, 10);
    }
  }
}
