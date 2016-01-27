/*
    Michelle Aphaiyarath
    Project 1 --> parsing and visualizing unstructured data
*/

BufferedReader reader;
final String FILENAME = "data.txt";
Letter[][] letter;
int cols = 380;
int rows = 380;

void setup()
{
  size (380, 380);
  letter = new Letter[cols][rows];
  readAndPrintOneCharacter();
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      letter[i][j] = new Letter (i, j, 1, 1);
    }
  }

}

void draw()
{
  background (0);
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      // assign color, i.e. int(random(255))
      // letter[i][j] = color(100, 150, 200);
      // letter[i][j].display();
      stroke (100, 50, 0);
      point (i, j);
    }
  }

  // if uppercase, subtract 32 from ASCII to get lowercase 
}

void readAndPrintOneCharacter()
{
  reader = createReader (FILENAME);
  try
  {
    int value = 0;
    while ((value = reader.read()) != -1)
    {
      char character = (char) value;
      println (character);
    }
  }
  catch (IOException e)
  {
    println ("Error: Could not read data.");
    e.printStackTrace();
  }
}

void mousePressed()
{
  
}