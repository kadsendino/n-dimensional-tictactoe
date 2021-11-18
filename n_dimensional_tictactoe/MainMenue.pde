class MainMenue extends Menue
{
  Button singlePBt, manualBt, statsBt, settingsBt, aboutBt;
  
  MainMenue()
  {
    super();
    
    backBt.label = "QUIT";

    this.singlePBt = new Button(width/2-this.w/3, this.y+this.w/5, this.w/1.5, this.w/5, "SINGLEPLAYER");
    this.statsBt = new Button(width/2-this.w/3, this.y+this.w/5*2.5, this.w/1.5, this.w/5, "STATISTICS");
    this.settingsBt = new Button(width/2-this.w/3, this.y+this.w/5*4, this.w/1.5, this.w/5, "SETTINGS");
    this.manualBt = new Button(width/2-this.w/3, this.y+this.w/5*5.5, this.w/1.5, this.w/5, "HOW TO PLAY");
    this.aboutBt = new Button(width/2-this.w/3, this.y+this.w/5*7, this.w/1.5, this.w/5, "ABOUT");
  }
  
  void draw()
  {
    super.draw();
    
    this.singlePBt.draw();
    this.manualBt.draw();
    this.statsBt.draw();
    this.settingsBt.draw();
    this.aboutBt.draw();
  }
  
  void mousePressed()
  {
    if(this.singlePBt.mouseOver())
    { this.singlePBt.selected = true; }
    else if(this.manualBt.mouseOver())
    { this.manualBt.selected = true; }
    
    else if(this.statsBt.mouseOver())
    { this.statsBt.selected = true; }
    else if(this.settingsBt.mouseOver())
    { this.settingsBt.selected = true; }
    
    else if(this.aboutBt.mouseOver())
    { this.aboutBt.selected = true; }
    else if(this.backBt.mouseOver())
    { this.backBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.singlePBt.mouseOver() && this.singlePBt.selected)
    { changeMode = 3; }
    else if(this.statsBt.mouseOver() && this.statsBt.selected)
    { changeMode = 6; }
    else if(this.settingsBt.mouseOver() && this.settingsBt.selected)
    { changeMode = 2; }
    else if(this.manualBt.mouseOver() && this.manualBt.selected)
    { createError("COMMING VERY SOON..."); }
    else if(this.aboutBt.mouseOver() && this.aboutBt.selected)
    { changeMode = 4; }
    else if(this.backBt.mouseOver() && this.backBt.selected)
    { quitGame(); }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  {
    this.singlePBt.selected = false;
    this.manualBt.selected = false;
    this.statsBt.selected = false;
    this.settingsBt.selected = false;
    this.aboutBt.selected = false;
    this.backBt.selected = false;
  }
}
