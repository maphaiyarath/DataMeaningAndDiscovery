class Walker {
  final float NOISE_DELTA = 0.01;
  final int MAX_VEL = 1;
  PVector loc, vel, accel, tendency;
  int radius;
  float xoff, var;
  
  Walker (PVector loc) {
    this.loc = loc;
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
    tendency = new PVector (1.5, 0);
    radius = 20;
    xoff = 0.0;
    var = 0;
  }
  
  void drawWalker() {
    stroke (0);
    fill (150, 60, 170);
    ellipse (loc.x, loc.y, radius, radius);
  }
  
  void walk() {
    accel = PVector.fromAngle (noise (xoff) * TWO_PI);
    loc.add (vel);
    vel.add (accel);
    vel.add (tendency);
    vel.limit (MAX_VEL);
    xoff += NOISE_DELTA;
    if (loc.x < 0) loc.x = width;
    if (loc.x > width) loc.x = 0;
    if (loc.y < 0) loc.y = height;
    if (loc.y > height) loc.y = 0;
  }
  
  void applyForce (PVector v) {
    vel.add (v);
  }
}

/*
xoff += 0.01;
var = noise(xoff);
var = map (loc.x, 0, 1, 0, width);
*/