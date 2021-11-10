class About extends Menue
{
  Button creditsBt;
  
  About()
  {
    super();
    this.creditsBt = new Button(this.x+this.w/2-this.w/8, this.y+this.h/2+this.w/6, this.w/4, this.w/5, "CREDITS");
  }
  
  void draw()
  {
    super.draw();
    
    this.creditsBt.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("version 0.1", this.x+this.w/2, this.y+this.h/20);
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.creditsBt.mouseOver())
    {
      createError("n-dimensional Tic-Tac-Toe\n\n");
      createError("a M1Productions production\n");
      createError("Programmers:");
      createError("Max");
      createError("Vale");
      fade = 600;
    }
  }
}
