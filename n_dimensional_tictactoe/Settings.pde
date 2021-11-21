class Settings extends Menue
{
  int devSet=0;
  Boolean darkMode=false, showBackButtons=true;;
  Button darkModeBt, devSetBt, backToggleBt, ajustColorBt;
  
  Settings()
  {
    super();
    this.darkModeBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5, this.w/1.5, this.w/5, "DARK MODE");
    this.ajustColorBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*2.5, this.w/1.5, this.w/5, "Ajust COLOR");
    this.backToggleBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*4, this.w/1.5, this.w/5, "Hide BACK Buttons");
    this.devSetBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*5.5, this.w/1.5, this.w/5, "dev. options: "+devSettings);
  }
  
  void draw()
  {
    super.draw();
    this.darkModeBt.draw();
    this.devSetBt.draw();
    this.backToggleBt.draw();
    this.ajustColorBt.draw();
    
    this.devSet--;
  }
  
  void mousePressed()
  {
    super.mousePressed();
    if(this.darkModeBt.mouseOver())
    { this.darkModeBt.selected = true; }
    else if(this.devSetBt.mouseOver())
    { this.devSetBt.selected = true; }
    else if(this.backToggleBt.mouseOver())
    { this.backToggleBt.selected = true; }
    else if(this.ajustColorBt.mouseOver())
    { this.ajustColorBt.selected = true; }
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
        this.darkModeBt.label = "LIGHT MODE";
        m1logoIMG = loadImage("m1logoLight.png");
      }
      else
      {
        this.darkModeBt.label = "DARK MODE";
        m1logoIMG = loadImage("m1logoDark.png");
      }
    }
    
    else if(this.ajustColorBt.mouseOver() && this.ajustColorBt.selected)
    { changeMode = 8; }
    
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
    
    else if(this.backToggleBt.mouseOver() && this.backToggleBt.selected == true)
    {
      this.showBackButtons = !this.showBackButtons;
      if(this.showBackButtons)
      { this.backToggleBt.label = "Hide BACK buttons"; }
      else
      { this.backToggleBt.label = "Show BACK buttons"; }
    }
    
    super.mouseUp();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.darkModeBt.selected = false;
    this.devSetBt.selected = false;
    this.backToggleBt.selected = false;
    this.ajustColorBt.selected = false;
  }
}
