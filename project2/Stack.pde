class Stack extends Walker {
  Stack (PVector loc, PVector tendency) {
    super (loc, tendency);
  }
  
  void printInfo() {
    // elements
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + count;
    text (elementCount, 260, 725);
    
    // does stack have a capacity?
    /*
    // capacity
    textAlign (LEFT, TOP);
    String capacityCount = "CAPACITY: " + capacity;
    text (capacityCount, 10, 725)
    */
  }
}