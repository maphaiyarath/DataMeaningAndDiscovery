class Walker {
  final float NOISE_DELTA = 0.01;
  final int MAX_VEL = 1;
  PVector loc, vel, accel, tendency;
  int count, diameter;
  float xoff;
  ArrayList<Prey> data = new ArrayList<Prey>();
  
  Walker (PVector loc, PVector tendency) {
    this.loc = loc;
    this.tendency = tendency;
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
    tendency = new PVector (0, 0);
    count = 0;
    diameter = 20;
    xoff = 0.0;
  }
  
  void drawWalker() {
    stroke (255);
    strokeWeight (4);
    fill (255);
    ellipse (loc.x, loc.y, diameter, diameter);
    for (Prey p : data) {
      strokeWeight (2);
      fill (p.c);
      ellipse (p.loc.x, p.loc.y, 8, 8);
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
    if (loc.y < 0) loc.y = 500 - diameter / 2;
    if (loc.y > 500 - diameter / 2) loc.y = 0;
  }
  
  void eat (Prey p) {
    if ((p.loc.x < 251) || ((p.loc.x > 500) && (p.loc.x < 751))) {
      count++;
      data.add (p);
      p.loc.x = random (246);
      p.loc.y = random (height - 250, height - 4);
    } else {
      if (count > 0) {
        count--;
      }
      data.remove (p);
      // delete data from structure
    }
  }
  
  boolean isTouching (Prey p) {
    return dist (loc.x, loc.y, p.loc.x, p.loc.y) < (diameter / 2 + p.diameter / 2);
  }
}