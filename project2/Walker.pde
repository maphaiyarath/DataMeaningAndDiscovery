class Walker {
  PVector loc, vel;
  int radius;
  float xoff, var;
  
  Walker (PVector loc) {
    this.loc = loc;
    var = 0;
    vel = new PVector (1, var);
    radius = 20;
    xoff = 0.0;
  }
  
  void drawWalker() {
    stroke (0);
    fill (150, 60, 170);
    ellipse (loc.x, loc.y, radius, radius);
  }
  
  void walk() {
    // xoff += 0.01;
    // var = noise (xoff);
    loc.add (vel);
  }
}

/*
xoff += 0.01;
var = noise(xoff);
var = map (loc.x, 0, 1, 0, width);
*/