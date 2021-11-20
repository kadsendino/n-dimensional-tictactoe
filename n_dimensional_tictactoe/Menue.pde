class Menue
{
  float x, y, w, h, st;
  Button backBt;
  
  Menue()
  {
    this.x = width/10;
    this.y = height/8;
    this.w = width/10*8;
    this.h = height/8*6;
    
    this.backBt = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*8.5, this.w/5, "BACK");
  }

  void draw()
  { this.backBt.draw(); }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { this.backBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.backBt.mouseOver() && this.backBt.selected)
    { changeMode = 0; }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  { this.backBt.selected = false; }
}
