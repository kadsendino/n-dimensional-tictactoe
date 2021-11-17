class Statistics extends Menue
{
  Statistics()
  {
    super();
  }

  void draw()
  {
    super.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("Comming Soon!", this.x+this.w/2, this.y+this.h/20);
  }
  
  void mousePressed()
  {
    super.mousePressed();
  }
  void mouseReleased()
  {
    super.mouseReleased();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
  }
}
