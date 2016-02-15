// Michelle Aphaiyarath
// Project 2 - Data Structure Safari & Adventures in Algorithms

final int PREY_COUNT = 75;
final int COLOR_COUNT = 5;
Walker bag;
PFont font;
// ArrayList<Walker> bags = new ArrayList<Walker>();
ArrayList<Prey> prey = new ArrayList<Prey>();
color[] palette = new color[COLOR_COUNT];

void setup() {
  size (1000, 750);
  font = createFont ("Futura-Medium", 12);
  bag = new Walker (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1)));
  /*
  for (int i = 0; i < BAG_COUNT; i++) {
    bags.add (new Walker (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1))));
  }
  */
  for (int i = 0; i < COLOR_COUNT; i++) {
    palette[i] = color (random (255), random (255), random (255));
  }
  for (int i = 0; i < PREY_COUNT; i++) {
    PVector loc = new PVector (random (40, width - 5), random (5, 495));
    color col = palette[(int) random (COLOR_COUNT)];
    prey.add (new Prey (loc, col));
  }
}

void draw() {
  background (200, 170, 150);
  for (int i = 1; i < 4; i++) {
    stroke (190, 160, 140);
    strokeWeight (3);
    line (250 * i, 0, 250 * i, height);
  }
  for (int i = prey.size() - 1; i >= 0; --i) {
    Prey p = prey.get(i);
    p.drawPrey();
    if (bag.isTouching (p)) {
      bag.eat (p);
      prey.remove (p);
    }
  }
  bag.drawWalker();
  bag.walk();
  /*
  for (int i = 0; i < bags.size(); i++) {
    Walker w = bags.get(i);
    w.drawWalker();
    w.walk();
  }
  */
  stroke (190, 160, 140);
  strokeWeight (4);
  line (0, 500, width, 500);
  fill (120, 90, 70);
  textFont (font);
  textAlign (CENTER, CENTER);
  text ("BAG", 125, 510);
  text ("SET", 375, 510);
  text ("QUEUE", 625, 510);
  text ("STACK", 875, 510);
  for (int i = 0; i < 4; i++) {
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + bag.count;
    text (elementCount, 250 * i + 10, 725);
    textAlign (LEFT, TOP);
    text ("CAPACITY: ", 250 * i + 10, 725);
  }
  for (int i = 0; i < 2; i++) {
    textAlign (CENTER, CENTER);
    text ("ADD", 500 * i + 125, 10);
    text ("DELETE", 500 * i + 375, 10);
  }
}

// set - unsorted, unordered, unique?
// inheritance for dif data structures?

// (10) displays at least 4 data structures that move over time
// (5) zones properly support logic of adding / deleting data from structures
// (20) adding / deleting data to / from structures adheres to properties of that structure
// (10) appropriate search algorithms used before adding / deleting data
// (10) "state" illustrations communicate distinguishing aspects of each structure

// tree
// do you have a 7
// top down, left to right - ask if tree has 7
// to traverse - left first, then depth
// draw root node at certain coord
// draw treeonleft();
// recursively?

// easy - bag, set, stack, linked list
// hard - tree, graph