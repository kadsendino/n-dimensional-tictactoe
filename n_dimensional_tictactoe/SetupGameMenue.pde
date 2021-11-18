class SetupGameMenue extends Menue
{
  int dimensions=2;
  
  Button playBt, dimensionsBt, plusBt, minusBt;
  
  SetupGameMenue()
  {
    super();
    this.playBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2+this.w/6, this.w/5, "PLAY");
    this.dimensionsBt  = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2-this.w/10, this.w/5, str(this.dimensions));
    this.minusBt = new Button(this.x+this.w/4-this.w/10, this.y+this.h/2-this.w/10, this.w/5, "-");
    this.plusBt = new Button(this.x+this.w/4*3-this.w/10, this.y+this.h/2-this.w/10, this.w/5, "+");
  }
  
  void draw()
  {
    super.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("DIMENSIONS", this.x+this.w/2, this.y+this.h/2-this.w/10*3);
    
    this.dimensionsBt.draw();
    this.minusBt.draw();
    this.plusBt.draw();
    playBt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { changeMode = 3; }
    else if(this.minusBt.mouseOver())
    {
      this.dimensions--;
      if(this.dimensions < 0)
      { this.dimensions = 0; }
      this.dimensionsBt.label = str(this.dimensions);
    }
    else if(this.plusBt.mouseOver())
    {
      this.dimensions++;
      this.dimensionsBt.label = str(this.dimensions);
    }
    else if(this.playBt.mouseOver())
    { changeMode = 1; }
  }
}
