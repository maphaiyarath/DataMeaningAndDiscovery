BufferedReader reader;

void setup()
{
  try
  {
    reader = createReader ("data.txt");
    int value = 0;
    while ((value = reader.read()) != -1)
    {
      char c = (char) value;
      println (c);
    }
  }
  catch (IOException e)
  {
    e.printStackTrace();
  }
}

void draw()
{

}