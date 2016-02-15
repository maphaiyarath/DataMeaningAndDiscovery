// Michelle Aphaiyarath
// Project 2 - Data Structure Safari & Adventures in Algorithms

final int PREY_COUNT = 100;
final int COLOR_COUNT = 10;
Baggins bag;
Stack stack;
Queue q;
Tree tree;
Text text;
ArrayList<Prey> prey = new ArrayList<Prey>();
color[] palette = new color[COLOR_COUNT];

void setup() {
  size (1000, 750);
  bag = new Baggins (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1)));
  stack = new Stack (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1)));
  q = new Queue (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1)));
  tree = new Tree (new PVector (20, random (500)), new PVector (random (-0.1, 5), random (-1, 1)));
  text = new Text();
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
  text.drawDivisions();
  for (int i = prey.size() - 1; i >= 0; --i) {
    Prey p = prey.get(i);
    p.drawPrey();
    if (bag.isTouching (p)) {
      bag.eat (p);
      prey.remove (p);
    }
    if (q.isTouching (p)) {
      q.eat (p);
      prey.remove (p);
    }
    if (stack.isTouching (p)) {
      stack.eat (p);
      prey.remove (p);
    }
    if (tree.isTouching (p)) {
      tree.eat (p);
      prey.remove (p);
    }
  }
  bag.drawWalker();
  bag.walk();
  bag.printName();
  bag.printInfo();
  stack.drawWalker();
  stack.walk();
  stack.printName();
  stack.printInfo();
  q.drawWalker();
  q.walk();
  q.printName();
  q.printInfo();
  tree.drawWalker();
  tree.walk();
  tree.printName();
  tree.printInfo();
  text.showText();
  text.drawLine();
}

// set - unsorted, unordered, unique?

// (3.75) zones properly support logic of adding / deleting data from structures
// (12.5) deleting data from structures adheres to properties of that structure
// (7.5) appropriate search algorithms used before adding / deleting data
// (7.5) "state" illustrations communicate distinguishing aspects of each structure

// tree
// do you have a 7
// top down, left to right - ask if tree has 7
// to traverse - left first, then depth
// draw root node at certain coord
// draw treeonleft();
// recursively?

// easy - bag, set, stack, linked list
// hard - tree, graph