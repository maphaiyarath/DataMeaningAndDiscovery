class Queue extends Walker {
  Queue (PVector loc, PVector tendency) {
    super (loc, tendency);
  }
  
  void printInfo() {
    // elements
    textAlign (LEFT, BOTTOM);
    String elementCount = "ELEMENTS: " + count;
    text (elementCount, 510, 725);
    
    // does stack have a capacity?
    /*
    // capacity
    textAlign (LEFT, TOP);
    String capacityCount = "CAPACITY: " + capacity;
    text (capacityCount, 10, 725)
    */
  }
}