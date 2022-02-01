class InGameMenue extends Menue
{
  Button continueBt;
  
  InGameMenue()
  {
    super();
    
    this.backBt.label = "MENU";
    
    this.continueBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5, this.w/1.5, this.w/5, "CONTINUE");
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
    
    this.continueBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    
    if(this.continueBt.mouseOver())
    { this.continueBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.continueBt.mouseOver())
    {
      changeMode = 1;
      mode = 1;
    }
    super.mouseUp();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.continueBt.selected = false;
  }
}
