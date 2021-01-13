final color PAPER = color(220, 210, 170);
final color INK1 = color(255);
final color INK2 = color(0);
final color INK3 = color(210, 135, 10);

void setup() {
   size(480, 640);
   render();
   save("demo.jpg");
}

void render() {
   translate(width / 2.0, height / 2.0);
   scale(min(width, height) / 240.0);
   
   background(PAPER);
   
   fill(INK1);
   stroke(INK3);
   
   strokeWeight(3.0);
   
   // body
   ellipse(0,0, 130, 130);
   
   arc(0, -72, 80, 80, -PI, 0);
   arc(0, -72, 80, 23, 0, PI);
   
   fill(INK2);
   ellipse(0, -92, 15, 15);
   ellipse(18, -80, 8, 8);
   
   noStroke();
   
   fill(INK3);
   ellipse(-13, 6, 60, 60);
   
   fill(INK1);
   ellipse(-13, 6, 42, 42);
}
