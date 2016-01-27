class Letter
{
  int x, y, w, h;
  
  Letter()
  {
    //
  }
  
  Letter (int x, int y, int w, int h)
  {
    x = this.x;
    y = this.y;
    w = this.w;
    h = this.h;
  }
  
  // having trouble displaying color with class
  void display()
  {
    stroke (200, 150, 100);
    rect (x, y, w, h);
    fill ((int) random (255));
  }
}