class Baggins extends Walker {
  int capacity;
  
  Baggins (PVector loc, PVector tendency) {
    super (loc, tendency);
    capacity = 20;
  }
  
  void printName() {
    fill (0);
    textAlign (CENTER, CENTER);
    text ("BAG", loc.x, loc.y);
  }
  
  void printInfo() {
    // elements
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + count;
    text (elementCount, 10, 725);
    
    // capacity
    textAlign (LEFT, TOP);
    String capacityCount = "CAPACITY: " + capacity;
    text (capacityCount, 10, 725);
  }
}