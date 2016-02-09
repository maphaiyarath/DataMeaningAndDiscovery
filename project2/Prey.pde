class Prey {
  PVector loc;
  color c;
  int diameter;
  
  Prey (PVector loc, color c) {
    this.loc = loc;
    this.c = c;
    diameter = 10;
  }
  
  void drawPrey() {
    stroke (255);
    strokeWeight (2);
    fill (c);
    ellipse (loc.x, loc.y, diameter, diameter);
  }
}