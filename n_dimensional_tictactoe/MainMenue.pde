class MainMenue extends Menue
{
  Button playBt, settingsBt, aboutBt;
  
  MainMenue()
  {
    super();
    
    backBt.label = "QUIT";

    this.playBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2-this.w/10*2.9, this.w/5, "PLAY");
    this.settingsBt = new Button(this.x+this.w/2-this.w/6, this.y+this.h/2-this.w/16, this.w/3, this.w/5, "SETTINGS");
    this.aboutBt = new Button(this.x+this.w/2-this.w/8, this.y+this.h/2+this.w/6, this.w/4, this.w/5, "ABOUT");
  }
  
  void draw()
  {
    super.draw();
    
    this.playBt.draw();
    this.settingsBt.draw();
    this.aboutBt.draw();
  }
  
  void mousePressed()
  {
    if(this.playBt.mouseOver())
    { changeMode = 3; }
    else if(this.settingsBt.mouseOver())
    { changeMode = 2; }
    else if(this.aboutBt.mouseOver())
    { changeMode = 4; }
    else if(this.backBt.mouseOver())
    { System.exit(0); }
  }
}
