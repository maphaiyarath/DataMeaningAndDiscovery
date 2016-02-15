class Queue extends Walker {
  int xLoc;
  
  Queue (PVector loc, PVector tendency) {
    super (loc, tendency);
    xLoc = 0;
  }
  
  void printName() {
    fill (0);
    textAlign (CENTER, CENTER);
    text ("QUEUE", loc.x, loc.y);
  }
  
  void printInfo() {
    // elements
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + count;
    text (elementCount, 510, 725);
  }
  
  void eat (Prey p) {
    if ((p.loc.x < 251) || ((p.loc.x > 500) && (p.loc.x < 751))) {
      count++;
      data.add (p);
      p.loc.x = 258 + xLoc;
      p.loc.y = 625;
      xLoc += 8;
    } else {
      if (count > 0) {
        count--;
      }
      data.remove (p);
      // delete data from structure
    }
  }
}