// Michelle Aphaiyarath
// Project 2 - Data Structure Safari & Adventures in Algorithms

final int WALKER_COUNT = 10;
Walker[] walkers;

void setup() {
  size (800, 700);
  walkers = new Walker[WALKER_COUNT];
  for (int i = 0; i < WALKER_COUNT; i++) {
    walkers[i] = new Walker(new PVector (random (width), random (height)));
  }
}

void draw() {
  background (200, 170, 150);
  for (int i = 0; i < WALKER_COUNT; i++) {
    walkers[i].drawWalker();
    walkers[i].walk();
    walkers[i].applyForce (new PVector (-0.5, 0));
  }
}