class Walker {
  final float NOISE_DELTA = 0.01;
  final int MAX_VEL = 1;
  PVector loc, vel, accel, tendency;
  int radius;
  float xoff;
  
  Walker (PVector loc, PVector tendency) {
    this.loc = loc;
    this.tendency = tendency;
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
    tendency = new PVector (1.4, 0);
    radius = 20;
    xoff = 0.0;
  }
  
  void drawWalker() {
    stroke (255);
    strokeWeight (5);
    fill (0);
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
    if (loc.y < 0) loc.y = 500;
    if (loc.y > 500) loc.y = 0;
  }
  
  void applyForce (PVector v) {
    vel.add (v);
  }
}