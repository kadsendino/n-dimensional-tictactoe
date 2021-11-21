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
  {
    if(settings.showBackButtons)
    this.backBt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver() && settings.showBackButtons)
    { this.backBt.selected = true; }
  }
  boolean mouseUp()
  {
    if(this.backBt.mouseOver() && this.backBt.selected && settings.showBackButtons)
    {
      changeMode = 0;
      return true;
    }
    
    this.unselectButtons();
    
    return false;
  }
  
  void unselectButtons()
  { this.backBt.selected = false; }
}
