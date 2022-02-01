class About extends Menue
{
  float logoX, logoY, logoW, logoH;
  
  Button creditsBt;
  
  About()
  {
    super();
    
    this.logoX = this.x+this.w/4;
    this.logoY = this.y+this.h/5;
    this.logoW = this.w/2;
    this.logoH = this.logoW;
    
    this.creditsBt = new Button(this.x+this.w/2-this.w/7, this.y+this.w/5*5.5, this.w/3.5, this.w/5, "CREDITS");
  }
  
  void draw()
  {
    super.draw();
    
    image(m1logoIMG, this.logoX, this.logoY, this.logoW, this.logoH);
    
    this.creditsBt.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("version 0.1.4", this.x+this.w/2, this.y+this.h/20);
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.creditsBt.mouseOver())
    { this.creditsBt.selected = true; }
  }
  
  void mouseReleased()
  {
    if(backBt.mouseOver() && this.backBt.selected)
    {
      changeMode = 0;
      clearErrors();
    }
    else if(this.creditsBt.mouseOver() && this.creditsBt.selected)
    {
      clearErrors();
      createError("n-dimensional Tic-Tac-Toe\n\n");
      createError("a M1Productions production\n");
      createError("Programmers:");
      createError("Max");
      createError("Felix");
      fade = 600;
    }
    
    this.unselectButtons();
    {
      super.unselectButtons();
      this.creditsBt.selected = false;
    }
  }
}
