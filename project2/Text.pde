class Text {
  PFont font;
  
  Text() {
    font = createFont ("Futura-Medium", 12);
  }
  
  void showText() {
    fill (120, 90, 70);
    textFont (font);
    textAlign (CENTER, CENTER);
    text ("BAG", 125, 510);
    text ("QUEUE", 375, 510);
    text ("STACK", 625, 510);
    text ("TREE", 875, 510);
    for (int i = 0; i < 2; i++) {
      textAlign (CENTER, CENTER);
      text ("ADD", 500 * i + 125, 10);
      text ("DELETE", 500 * i + 375, 10);
    }
  }
}