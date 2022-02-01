class Statistics extends Menue
{
  int won, played; //instead: for every dimension ever played: played, won, moves made
  
  Button resetBt;
  
  Statistics(int won, int played)
  {
    super();
    
    this.won = won;
    this.played = played;
    
    this.resetBt = new Button(width/2-this.w/3, this.y+this.w/5*7, this.w/1.5, this.w/5, "RESET STATISTICS");
  }

  void draw()
  {
    super.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("Comming Soon!", this.x+this.w/2, this.y+this.h/20);
    text(this.won, this.x+this.w/2, this.y+this.h/10);
    text(this.played, this.x+this.w/2, this.y+this.h/5);
    
    this.resetBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.resetBt.mouseOver())
    { this.resetBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.resetBt.mouseOver() && this.resetBt.selected)
    {
      String[]content = {"9","8"};
      fileM.saveFile(content, "stats.ndttt");
      { createError("ERROR : 02 : fileM.write"); }
    }
    super.mouseUp();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.resetBt.selected = false;
  }
}
