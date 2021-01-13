void setup() {
  size(550, 550);
  background(255);
  smooth(10);
  strokeWeight(8.5);
  render();
  save("demo.jpg");
}

void render() {
  for (int i = 0; i <= width; i += 25) {
     line(0, 0, i, height);
     line(width, height, i, 0);
  }
}
