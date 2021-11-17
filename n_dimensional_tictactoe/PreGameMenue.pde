class PreGameMenue extends Menue
{
  int dimensions=2;
  
  Button playBt, dimensionsBt, plusBt, minusBt;
  
  PreGameMenue()
  {
    super();
    this.dimensionsBt  = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5, this.w/5, str(this.dimensions));
    this.minusBt = new Button(this.x+this.w/4-this.w/10, this.y+this.w/5, this.w/5, "-");
    this.plusBt = new Button(this.x+this.w/4*3-this.w/10, this.y+this.w/5, this.w/5, "+");
    this.playBt = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*2.5, this.w/5, "PLAY");
  }
  
  void draw()
  {
    super.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("DIMENSIONS", this.x+this.w/2, this.y+this.h/20);
    
    this.dimensionsBt.draw();
    this.minusBt.draw();
    this.plusBt.draw();
    playBt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { this.backBt.selected = true; }
    
    else if(this.minusBt.mouseOver())
    { this.minusBt.selected = true; }
    else if(this.plusBt.mouseOver())
    { this.plusBt.selected = true; }
    
    else if(this.playBt.mouseOver())
    { this.playBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.backBt.mouseOver() && this.backBt.selected)
    { changeMode = 0; }
    else if(this.minusBt.mouseOver() && this.minusBt.selected)
    {
      this.dimensions--;
      if(this.dimensions < 0)
      { this.dimensions = 0; }
      this.dimensionsBt.label = str(this.dimensions);
    }
    else if(this.plusBt.mouseOver() && this.plusBt.selected)
    {
      this.dimensions++;
      this.dimensionsBt.label = str(this.dimensions);
    }
    else if(this.playBt.mouseOver() && this.playBt.selected)
    { changeMode = 1; }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  {
    this.backBt.selected = false;
    this.minusBt.selected = false;
    this.plusBt.selected = false;
    this.playBt.selected = false;
  }
}
