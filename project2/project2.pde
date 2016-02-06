// Michelle Aphaiyarath
// Project 2 - Data Structure Safari & Adventures in Algorithms

final int WALKER_COUNT = 15;
ArrayList<Walker> walker = new ArrayList<Walker>();

void setup() {
  size (1000, 720);
  for (int i = 0; i < WALKER_COUNT; i++) {
    walker.add (new Walker (new PVector (random (width), random (500)), new PVector (random (-0.2, 5), random(-5, 0.2))));
  }
}

void draw() {
  background (200, 170, 150);
  for (int i = 0; i < walker.size(); i++) {
    Walker w = walker.get(i);
    w.drawWalker();
    w.walk();
    // walkers[i].applyForce (new PVector (-0.01, 0));
  }
  noStroke();
  fill (255, 0, 0);
  rect (0, 500, width, 15);
}