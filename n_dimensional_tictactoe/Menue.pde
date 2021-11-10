class Menue
{
  float x, y, w, h, st;
  Button backBt;
  
  Menue()
  {
    this.x = width/10;
    this.y = height/8*3;
    this.w = width/10*8;
    this.h = height/2;
    this.st = this.h/45;
    
    this.backBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h-this.w/5*1.2, this.w/5, "BACK");
  }

  void draw()
  {
    stroke(secCol);
    strokeWeight(this.st);
    fill(primCol);
    rect(this.x, this.y, this.w, this.h);
    
    this.backBt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { changeMode = 0; }
  }

  void refresh()
  {}
}
