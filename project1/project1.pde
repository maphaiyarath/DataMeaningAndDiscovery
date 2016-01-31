// Michelle Aphaiyarath
// Project 1 - Parsing & Visualizing Unstructured Data

import java.util.Map;
final String FILENAME = "alice.txt";
final int LETTER_VIZ = 0;
final int FREQ_VIZ = 1;
final int ALPHA_LETTERS = 26;
final int ASCII_OFFSET = 97;
BufferedReader buffer;
int state;
PImage letterViz;
int[] freqs = new int[ALPHA_LETTERS];
color[] palette = new color[ALPHA_LETTERS];

void setup() {
  size (380, 380);
  state = LETTER_VIZ;
  letterViz = createImage (380, 380, RGB);
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
  state = (state + 1) % 2;
}

void drawLetters() {
  background (255);
  image (letterViz, 0, 0);
}

void drawFreqs() {
  background (0);
  text ("graph", width/2, height/2);
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
    while ((character = buffer.read()) != -1) {
      if (Character.isAlphabetic (character)) {
        // treats upper and lower case letters the same
        char letter = (char) Character.toLowerCase (character);
        freqs[letter - ASCII_OFFSET]++;
        // consistently colorizes character occurrences
        letterViz.pixels[pixelPos] = palette[letter - ASCII_OFFSET];
      } else {
        // ignores non-alpha characters
        letterViz.pixels[pixelPos] = color (0);
      }
      pixelPos++;
    }
    // println (freqs);
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

// draws visual attention to occurrences of keyword (Alice)

// build a string, compare to "Alice"
// parse text as Strings
// for every nth char i have, color nth pixel with nth color
// loop over frequencies array
// processing map function
// to correctly present range of frequencies
// loop through every element to see which is max