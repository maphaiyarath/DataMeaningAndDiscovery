BufferedReader reader;

void setup()
{
  reader = createReader ("data.txt");

}

void draw()
{
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
    e.printStackTrace();
  }
  
}