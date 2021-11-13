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
    
    this.creditsBt = new Button(this.x+this.w/2-this.w/7, this.y+this.h/2+this.w/6, this.w/3.5, this.w/5, "CREDITS");
  }
  
  void draw()
  {
    super.draw();
    
    if(settings.darkMode)
    { image(m1logoLightIMG, this.logoX, this.logoY, this.logoW, this.logoH); }
    else
    { image(m1logoDarkIMG, this.logoX, this.logoY, this.logoW, this.logoH); }
    
    this.creditsBt.draw();
    
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("version 0.1.2", this.x+this.w/2, this.y+this.h/20);
  }
  
  void mousePressed()
  {
    if(backBt.mouseOver())
    {
      changeMode = 0;
      clearErrors();
    }
    else if(this.creditsBt.mouseOver())
    {
      clearErrors();
      createError("n-dimensional Tic-Tac-Toe\n\n");
      createError("a M1Productions production\n");
      createError("Programmers:");
      createError("Max");
      createError("Vale");
      fade = 600;
    }
  }
}
