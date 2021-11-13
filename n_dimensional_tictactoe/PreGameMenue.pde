class PreGameMenue extends Menue
{
  Button singlePBt;
  
  PreGameMenue()
  {
    super();
    this.singlePBt = new Button(this.x+this.w/2-this.w/4, this.y+this.h/2-this.w/10*2.9, this.w/2, this.w/5, "SINGLEPLAYER");
  }
  
  void draw()
  {
    super.draw();
    this.singlePBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.singlePBt.mouseOver())
    { changeMode = 5; }
  }
}
