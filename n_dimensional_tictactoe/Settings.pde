class Settings extends Menue
{
  int devSet=0;
  Boolean darkMode = false;
  Button darkModeBt, devSetBt;
  
  Settings()
  {
    super();
    this.darkModeBt = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5, this.w/5, "DARK");
    this.devSetBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*2.5, this.w/1.5, this.w/5, "dev. options: "+devSettings);
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
    { this.darkModeBt.selected = true; }
    else if(this.devSetBt.mouseOver())
    { this.devSetBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.darkModeBt.mouseOver() && this.darkModeBt.selected)
    {
      this.darkMode = !this.darkMode;
      color c = primCol;
      primCol = secCol;
      secCol = c;
      
      if(this.darkMode)
      {
        this.darkModeBt.label = "LIGHT";
        m1logoIMG = loadImage("m1logoLight.png");
      }
      else
      {
        this.darkModeBt.label = "DARK";
        m1logoIMG = loadImage("m1logoDark.png");
      }
    }
    
    else if(this.devSetBt.mouseOver() && this.devSetBt.selected)
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
    
    super.mouseReleased();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.darkModeBt.selected = false;
    this.devSetBt.selected = false;
  }
}
