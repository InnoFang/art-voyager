void setup() {
  size(700, 450);
  background(255);
  stroke(100);
  strokeWeight(4);
  render();
  save("demo.jpg");
}

void render() {
   int length = 50;
   int gap = 15, iter = 15;
   for (int i = 0; i < height; i += length) {
     line(0, i, width, i);
     boolean black = true;
     gap += iter;
     for (int j = 0; j < width; j += length) {
       if (black) fill(0);
       else fill(255);
       rect(j + gap, i, length, length);
       black = !black;
     }
     if (gap == 45 || gap == 15) iter *= -1;
   }
}
