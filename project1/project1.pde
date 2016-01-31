// Michelle Aphaiyarath
// Project 1 - Parsing & Visualizing Unstructured Data
// posted to github.com/maphaiyarath/crcp3310

final String FILENAME = "alice.txt";
final int LETTER_VIZ = 0;
final int FREQ_VIZ = 1;
final int ALPHA_LETTERS = 26;
final int ASCII_OFFSET = 97;
BufferedReader buffer;
int state;
char letter;
PImage letterViz;
PImage freqViz;
PFont font;
// uses appropriate data structures for managing data
int[] freqs = new int[ALPHA_LETTERS];
color[] palette = new color[ALPHA_LETTERS];

void setup() {
  size (380, 380);
  state = LETTER_VIZ;
  letterViz = createImage (380, 380, RGB);
  freqViz = createImage (380, 380, RGB);
  font = createFont ("Futura-Medium", 12);
  prepColors();
  prepFreqs();
  letterViz.loadPixels();
  letterViz.updatePixels();
}

void draw() {
  background (0);
  if (state == LETTER_VIZ) {
    drawLetters();
  } else {
    drawFreqs();
  }
}

void mousePressed() {
  // program reacts to user input & displays 2nd visualization
  state = (state + 1) % 2;
}

void drawLetters() {
  background (255);
  image (letterViz, 0, 0);
}

// (5) 2nd viz organizes and displays letter frequencies
// (5) 2nd viz draws attention to least & most frequent chars

void drawFreqs() {
  background (0);
  fill (255);
  textFont (font);
  textAlign (CENTER, BOTTOM);
  text ("Letter Frequencies of Alice in Wonderland", width/2, 360);
  // organizes & displays letter frequencies
  for (int i = 0; i < ALPHA_LETTERS; i++) {
    float scale = map (-freqs[i], 0, 13568, 0, 300);
    fill (palette[letter - ASCII_OFFSET]);
    rect (60 + (i * 10), 330, 5, scale);
  }
}

void prepFreqs() {
  for (int i = 0; i < ALPHA_LETTERS; ++i) {
    freqs[i] = 0;
  }
  // uses buffer to contain input data
  buffer = createReader (FILENAME);
  try {
    int character;
    int pixelPos = 0;
    // initial visualization of input data
    while ((character = buffer.read()) != -1) {
      if (Character.isAlphabetic (character)) {
        // treats upper and lower case letters the same
        letter = (char) Character.toLowerCase (character);
        // correctly calculates frequencies
        freqs[letter - ASCII_OFFSET]++;
        // consistently colorizes character occurrences
        letterViz.pixels[pixelPos] = palette[letter - ASCII_OFFSET];
      } else {
        // ignores non-alpha characters
        letterViz.pixels[pixelPos] = color (0);
      }
      pixelPos++;
    }
    printArray (freqs);
  } catch (IOException e) {
    println ("Error: Could not read data.");
    e.printStackTrace();
  }
}

void prepColors() {
  for (int i = 0; i < ALPHA_LETTERS; ++i) {
    palette[i] = color (random (255), random (255), random (255));
  }
}

// should be 397 'Alice'

// (5) draws visual attention to occurrences of keyword (Alice)
// (5) displays correct frequency of occurrences of keyword
// (10) well written, adhering to best practices in writing & design

// build a string, compare to "Alice"
// parse text as Strings
// for every nth char i have, color nth pixel with nth color
// loop over frequencies array
// to correctly present range of frequencies
// loop through every element to see which is max