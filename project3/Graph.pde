class Graph {
  color dark, rouge;
  int border;
  PFont font;
  String yRange;
  
  Graph() {
    dark = color (70, 30, 40);
    rouge = color (205, 105, 90);
    border = 100;
    font = createFont ("Futura-Medium", 36);
  }
  
  void label() {
    fill (rouge);
    textAlign (CENTER, CENTER);
    textFont (font);
    text ("INCOME DISTRIBUTION", width / 2, border / 2);
    textSize (24);
    text ("%", border / 2, height / 2);
    text ("YEAR", width / 2, height - (border / 2));
    for (int i = 0; i <= 35; i++) {
      textAlign (RIGHT, CENTER);
      textSize (12);
      fill (rouge);
      yRange = str(i);
      text (yRange, border - 5, (height - border) - (14.4 * i));
      
      strokeWeight (1);
      stroke (0, 50);
      line (border, border + 14.29 * i, width - border, border + 14.29 * i);
      
    }
  }
  
  void drawAxes() {
    stroke (dark);
    strokeWeight (4);
    line (border, border, border, height - border);
    line (border, height - border, height - border, height - border);
  }
  
  void drawBox() {
    noStroke();
    fill (255, 70);
    rectMode (CORNER);
    rect (((2 * width) / 3) - 10, height - 80, 220, 70);
  }
  
  void drawLegend (int y, color c, String s) {
    fill (c);
    noStroke();
    rect ((2 * width) / 3, y, 10, 10);
    
    fill (c);
    textAlign (LEFT, TOP);
    textFont (font);
    textSize (10);
    String temp = "INCOME SHARE HELD BY " + s + " 10%";
    text (temp, ((2 * width) / 3) + 15, y);
  }
}