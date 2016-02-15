class Tree extends Walker {
  Tree (PVector loc, PVector tendency) {
    super (loc, tendency);
  }
  
  void printName() {
    fill (0);
    textAlign (CENTER, CENTER);
    text ("TREE", loc.x, loc.y);
  }
  
  void printInfo() {
    // elements
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + count;
    text (elementCount, 760, 725);
  }
  
  void eat (Prey p) {
    if ((p.loc.x < 251) || ((p.loc.x > 500) && (p.loc.x < 751))) {
      count++;
      data.add (p);
      p.loc.x = random (754, width - 4);
      p.loc.y = random (height - 250, height - 4);
    } else {
      if (count > 0) {
        count--;
      }
      data.remove (p);
      // delete data from structure
    }
  }
}