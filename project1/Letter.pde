// well written, adhering to best practices in writing & design
class Letter {
  Letter() {
    //
  }
  
  void drawLetters() {
    background (255);
    image (letterViz, 0, 0);
  }

  void drawFreqs() {
    background (255);
    fill (0);
    textFont (font);
    textAlign (CENTER, CENTER);
    text ("Letter Frequencies in \"Alice in Wonderland\"", width/2, 350);
    int max = freqs[0];
    int min = freqs[0];
    float scaleFreq = 0;
    for (int i = 0; i < ALPHA_LETTERS; i++) {
      // draws attention to least & most frequent characters
      if (freqs[i] > max) {
        max = freqs[i];
        fill (palette[i]);
        textAlign (LEFT, TOP);
        String mx = "MAX = " + max; 
        text (mx, 230, 45);
      }
      if (freqs[i] < min) {
        // MIN NOT WORKING CORRECTLY
        min = freqs[i];
        fill (palette[i]);
        textAlign (LEFT, BOTTOM);
        String minimum = "MIN = " + min; 
        text (minimum, 230, 45);
      }
      // organizes & displays letter frequencies
      scaleFreq = map (-freqs[i], 0, 13568, 0, 300);
      fill (palette[i]);
      noStroke();
      rect (60 + (i * 10), 330, 5, scaleFreq);
    }
  }

  void prepFreqs() {
    for (int i = 0; i < ALPHA_LETTERS; ++i) {
      freqs[i] = 0;
    }
    // uses buffer to contain input data
    buffer = createReader (FILENAME);
    try {
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
  
  void findAlice() {
    int aliceCount = 0;
    buffer2 = createReader (FILENAME);
    try {
      String line;
      int alicePixel = 0;
      while ((line = buffer2.readLine()) != null) {
        String[] words = splitTokens (line, " )/:?;!(.'-,\"");
        // String[] words = line.split ("[a-zA-Z]+");
        for (int i = 0; i < words.length; i++) {
          if (words[i].equals ("Alice")) {
            // draws visual attention to occurrences of keyword
            aliceViz.pixels[alicePixel] = color (170, 240, 220);
            aliceCount++;
          } else {
            aliceViz.pixels[alicePixel] = color (0);
          }
        }
        alicePixel++;
      }
    } catch (IOException e) {
      println ("Error: Could not read data.");
      e.printStackTrace();
    }
    println ();
    background (0);
    image (aliceViz, 0, 0);
    // displays correct frequency of keyword
    fill (255);
    textAlign (CENTER, CENTER);
    String occur = "\"Alice\" occurs " + aliceCount + " times.";
    text (occur, width/2, 350);
  }
}

// draws occurrences of keyword
// displays frequency of keyword
// draws attention to min / max