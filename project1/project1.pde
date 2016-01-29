// Michelle Aphaiyarath
// Project 1 - Parsing & Visualizing Unstructured Data

final String FILENAME = "data.txt";
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
  prepFreqs();
  letterViz.loadPixels();
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
  background (0);
  text ("letters", width/2, height/2);
}

void drawFreqs() {
  background (0);
  text ("graph", width/2, height/2);
}

void prepFreqs() {
  for (int i = 0; i < ALPHA_LETTERS; ++i) {
    freqs[i] = 0;
  }
  buffer = createReader (FILENAME);
  try {
    int character;
    int pixelPos = 0;
    while ((character = buffer.read()) != -1) {
      if (!Character.isAlphabetic (character)) {
        continue;
      }
      char letter = (char) Character.toLowerCase (character);
      freqs[letter - ASCII_OFFSET]++;
      letterViz.pixels[pixelPos] = palette[letter - ASCII_OFFSET]++;
      pixelPos++;
    }
    println (freqs);
  } catch (IOException e) {
    println ("Error: Could not read data.");
    e.printStackTrace();
  }
}

// for every nth char i have, color nth pixel with nth color
// loop over frequencies array
// processing map function
// to correctly present range of frequencies
// loop through every element to see which is max