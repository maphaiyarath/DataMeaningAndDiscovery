class Walker {
  final float NOISE_DELTA = 0.01;
  final int MAX_VEL = 1;
  PVector loc, vel, accel, tendency;
  int diameter;
  float xoff;
  ArrayList<Prey> data = new ArrayList<Prey>();
  
  Walker (PVector loc, PVector tendency) {
    this.loc = loc;
    this.tendency = tendency;
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
    tendency = new PVector (1.4, 0);
    diameter = 20;
    xoff = 0.0;
  }
  
  void drawWalker() {
    stroke (255);
    strokeWeight (4);
    fill (0);
    ellipse (loc.x, loc.y, diameter, diameter);
    for (Prey p : data) {
      fill (p.c);
      ellipse (p.loc.x, p.loc.y, p.diameter, p.diameter);
    }
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
  
  void eat (Prey p) {
    data.add (p);
    p.loc.x = random (250);
    p.loc.y = random(height - 200, height);
  }
  
  boolean isTouching (Prey p) {
    return dist (loc.x, loc.y, p.loc.x, p.loc.y) < (diameter / 2 + p.diameter / 2);
  }
}