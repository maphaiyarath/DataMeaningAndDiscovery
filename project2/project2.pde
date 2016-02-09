// Michelle Aphaiyarath
// Project 2 - Data Structure Safari & Adventures in Algorithms

final int WALKER_COUNT = 1;
final int PREY_COUNT = 25;
final int COLOR_COUNT = 5;
Walker zom;
ArrayList<Walker> walker = new ArrayList<Walker>();
ArrayList<Prey> prey = new ArrayList<Prey>();
color[] palette = new color[COLOR_COUNT];

void setup() {
  size (1000, 720);
  zom = new Walker (new PVector (random (width), random (500)), new PVector (random (-0.1, 5), random(-0.1, 0.1)));
  for (int i = 0; i < WALKER_COUNT; i++) {
    walker.add (new Walker (new PVector (random (width), random (500)), new PVector (random (-0.1, 5), random(-0.1, 0.1))));
  }
  for (int i = 0; i < COLOR_COUNT; i++) {
    palette[i] = color (random (255), random (255), random (255));
  }
  for (int i = 0; i < PREY_COUNT; i++) {
    PVector loc = new PVector (random (width), random (500));
    color col = palette[(int) random (COLOR_COUNT)];
    prey.add (new Prey (loc, col));
  }
}

void draw() {
  background (200, 170, 150);
  zom.drawWalker();
  zom.walk();
  for (int i = 0; i < walker.size(); i++) {
    Walker w = walker.get(i);
    w.drawWalker();
    w.walk();
  }
  for (int i = prey.size() - 1; i >= 0; --i) {
    Prey p = prey.get(i);
    p.drawPrey();
    if (zom.isTouching (p)) {
      zom.eat (p);
      prey.remove (p);
    }
  }
  noStroke();
  fill (255);
  rect (0, 500, width, 15);
}