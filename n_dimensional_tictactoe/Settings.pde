class Settings extends Menue
{
  Boolean darkMode = false;
  Button darkModeBt;
  
  Settings()
  {
    super();
    darkModeBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2-this.w/10, this.w/5, "DARK");
  }
  
  void draw()
  {
    super.draw();
    this.darkModeBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.darkModeBt.mouseOver())
    {
      this.darkMode = true;
      color c = primCol;
      primCol = secCol;
      secCol = c;
      this.darkModeBt.label = "LIGHT";
    }
  }
}
