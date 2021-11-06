class MainMenue
{
  float x, y, w, h, st;
  color col = #130820;
  
  Button playBt, settingsBt;
  
  MainMenue()
  {
    this.x = width/10;
    this.y = height/8*3;
    this.w = width/10*8;
    this.h = height/2;
    this.st = this.h/45;

    this.playBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2-this.w/10, this.w/5, "PLAY");
    this.settingsBt = new Button(this.x+this.w/2-this.w/6, this.y+this.h/2+this.w/6, this.w/3, this.w/5, "SETTINGS");
  }
  
  void draw()
  {
    stroke(this.col);
    strokeWeight(this.st);
    noFill();
    rect(this.x, this.y, this.w, this.h);
    
    playBt.draw();
    settingsBt.draw();
  }
  void mousePressed()
  {
    if(this.playBt.mouseOver())
    { changeMode = 1; }
    else if(this.playBt.mouseOver())
    { changeMode = 2; }
  }
  void refresh()
  {}
}
