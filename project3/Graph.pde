class Graph {
  color rouge, blush;
  int border;
  PFont font;
  
  Graph() {
    rouge = color (205, 105, 90);
    blush = color (215, 180, 175);
    border = 100;
    font = createFont ("Futura-Medium", 24);
  }
  
  void label() {
    fill (rouge);
    textAlign (CENTER, CENTER);
    textFont (font);
    text ("INCOME DISTRIBUTION", width / 2, border / 2);
  }
  
  void drawAxes() {
    stroke (blush);
    strokeWeight (4);
    line (border, border, border, height - border);
    line (border, height - border, height - border, height - border);
  }
}