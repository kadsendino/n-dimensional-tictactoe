class Settings extends Menue
{
  int devSet=0;
  Boolean darkMode = false;
  Button darkModeBt, devSetBt;
  
  Settings()
  {
    super();
    this.darkModeBt = new Button(this.x+this.w/2-this.w/10, this.y+this.h/2-this.w/16, this.w/5, "DARK");
    this.devSetBt = new Button(this.x+this.w/2-this.w/3, this.y+this.h/2+this.w/6, this.w/1.5, this.w/5, "dev. options: "+devSettings);
  }
  
  void draw()
  {
    super.draw();
    this.darkModeBt.draw();
    this.devSetBt.draw();
    
    this.devSet--;
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.darkModeBt.mouseOver())
    {
      this.darkMode = (this.darkMode == false);
      color c = primCol;
      primCol = secCol;
      secCol = c;
      
      if(this.darkMode)
      { this.darkModeBt.label = "LIGHT"; }
      else
      { this.darkModeBt.label = "DARK"; }
    }
    else if(this.devSetBt.mouseOver())
    {
      clearErrors();
      createError("DEVELOPER OPTIONS");
      if(!devSettings && this.devSet < 50)
      {
        createError("To turn them on");
        createError("click again");
        this.devSet = fade;
      }
      else if(!devSettings && this.devSet >= 50)
      {
        createError("are now on");
        devSettings = true;
        this.devSet = 0;
      }
      else if(devSettings)
      {
        createError("are now turned off");
        devSettings = false;
      }
      this.devSetBt.label = "dev. options: "+devSettings;
    }
  }
}
