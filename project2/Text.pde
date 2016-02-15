class Text {
  PFont font;
  
  Text() {
    font = createFont ("Futura-Medium", 12);
  }
  
  void drawDivisions() {
    for (int i = 1; i < 4; i++) {
      stroke (190, 160, 140);
      strokeWeight (3);
      line (250 * i, 0, 250 * i, height);
    }
  }
  
  void drawLine() {
    stroke (190, 160, 140);
    strokeWeight (4);
    line (0, 500, width, 500);
  }
  
  void showText() {
    fill (120, 90, 70);
    textFont (font);
    textAlign (CENTER, CENTER);
    
    // headers for state visualizations
    text ("BAG", 125, 510);
    text ("QUEUE", 375, 510);
    text ("STACK", 625, 510);
    text ("TREE", 875, 510);
    
    // headers for add / delete landscape
    for (int i = 0; i < 2; i++) {
      textAlign (CENTER, CENTER);
      text ("ADD", 500 * i + 125, 10);
      text ("DELETE", 500 * i + 375, 10);
    }
  }
}