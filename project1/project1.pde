// Michelle Aphaiyarath
// Project 1 - Parsing & Visualizing Unstructured Data
// posted to github.com/maphaiyarath/crcp3310

final String FILENAME = "alice.txt";
final int LETTER_VIZ = 0;
final int FREQ_VIZ = 1;
final int ALICE_VIZ = 2;
final int ALPHA_LETTERS = 26;
final int ASCII_OFFSET = 97;
BufferedReader buffer, buffer2;
Letter story;
int state;
int character;
char letter;
PImage letterViz;
PImage freqViz;
PImage aliceViz;
PFont font;
// uses appropriate data structures for managing data
int[] freqs = new int[ALPHA_LETTERS];
color[] palette = new color[ALPHA_LETTERS];

void setup() {
  size (380, 380);
  state = LETTER_VIZ;
  story = new Letter();
  letterViz = createImage (380, 380, RGB);
  freqViz = createImage (380, 380, RGB);
  aliceViz = createImage (380, 380, RGB);
  font = createFont ("Futura-Medium", 14);
  story.prepColors();
  story.prepFreqs();
  story.findAlice();
  letterViz.loadPixels();
  letterViz.updatePixels();
  freqViz.loadPixels();
  freqViz.updatePixels();
  aliceViz.loadPixels();
  aliceViz.updatePixels();
}

void draw() {
  background (0);
  if (state == LETTER_VIZ) {
    story.drawLetters();
  } else if (state == FREQ_VIZ) {
    story.drawFreqs();
  } else {
    story.findAlice();
  }
}

void mousePressed() {
  // program reacts to user input & displays 2nd visualization
  state = (state + 1) % 3;
}