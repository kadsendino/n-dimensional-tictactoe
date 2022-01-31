class InGameMenue extends Menue
{
  Button menueBt;
  
  InGameMenue()
  {
    super();
    
    this.backBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5, this.w/1.5, this.w/5, "CONTINUE");
    
    
    this.menueBt = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*8.5, this.w/5, "MENUE");
  }
  
  void draw()
  {
    background(backGroundIMG);
    noStroke();
    fill(primCol,200);
    rect(0,0,width,height);
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("GAME PAUSED", this.x+this.w/2, this.y+this.h/20);
    
    super.draw();
    
    this.menueBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    
    if(this.menueBt.mouseOver())
    { this.menueBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.menueBt.mouseOver())
    {
      changeMode = 0;
      mode = 0;
    }
    else if(this.backBt.mouseOver() && this.backBt.selected && settings.showBackButtons)
    {
      changeMode = 1;
    }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.menueBt.selected = false;
  }
}
