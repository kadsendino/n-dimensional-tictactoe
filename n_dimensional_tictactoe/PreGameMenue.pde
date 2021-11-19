class PreGameMenue extends Menue
{
  int dimensions=2, gameMode=0, players=1;
  
  Button playBt, dimensionsBt, plusBt, minusBt, gMode0Bt, gMode1Bt, playersBt, playerPlusBt, playerMinusBt;
  
  PreGameMenue()
  {
    super();
    this.dimensionsBt  = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*1.5, this.w/5, str(this.dimensions));
    this.dimensionsBt.setCorners(0);
    this.minusBt = new Button(this.x+this.w/4-this.w/10, this.y+this.w/5*1.5, this.w/5, "-");
    this.minusBt.setCorners(20,0,0,20);
    this.plusBt = new Button(this.x+this.w/4*3-this.w/10, this.y+this.w/5*1.5, this.w/5, "+");
    this.plusBt.setCorners(0,20,20,0);
    
    this.playersBt  = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*3.5, this.w/5, str(this.players));
    this.playersBt.setCorners(0);
    this.playerMinusBt = new Button(this.x+this.w/4-this.w/10, this.y+this.w/5*3.5, this.w/5, "-");
    this.playerMinusBt.setCorners(20,0,0,20);
    this.playerPlusBt = new Button(this.x+this.w/4*3-this.w/10, this.y+this.w/5*3.5, this.w/5, "+");
    this.playerPlusBt.setCorners(0,20,20,0);
    
    this.gMode0Bt  = new Button(this.x+this.w/2-this.w/10*3.25, this.y+this.w/5*5.5, this.w/10*3, this.w/5, "CLASSIC");
    this.gMode0Bt.setCorners(20,0,0,20);
    this.gMode0Bt.selected = true;
    this.gMode1Bt = new Button(this.x+this.w/2+this.w/10*0.25, this.y+this.w/5*5.5, this.w/10*3, this.w/5, "EXTREME");
    this.gMode1Bt.setCorners(0,20,20,0);
    
    this.playBt = new Button(this.x+this.w/2-this.w/10, this.y+this.w/5*7, this.w/5, "PLAY");
  }
  
  void draw()
  {
    super.draw();
    
    textSize(this.h/15);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text("SINGLEPLAYER", width/2, this.y);
    textSize(this.h/20);
    text("DIMENSIONS", width/2, this.y+this.w/5);
    text("PLAYERS", width/2, this.y+this.w/5*3);
    text("GAME MODE", width/2, this.y+this.w/5*5);
    
    this.dimensionsBt.draw();
    this.minusBt.draw();
    this.plusBt.draw();
    this.playersBt.draw();
    this.playerPlusBt.draw();
    this.playerMinusBt.draw();
    this.gMode0Bt.draw();
    this.gMode1Bt.draw();
    this.playBt.draw();
    if(this.gMode1Bt.selected && this.gMode0Bt.selected)
    { this.gMode1Bt.selected = false; }
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { this.backBt.selected = true; }
    
    else if(this.minusBt.mouseOver())
    { this.minusBt.selected = true; }
    else if(this.plusBt.mouseOver())
    { this.plusBt.selected = true; }
    
    else if(this.playerMinusBt.mouseOver())
    { this.playerMinusBt.selected = true; }
    else if(this.playerPlusBt.mouseOver())
    { this.playerPlusBt.selected = true; }
    
    else if(this.gMode0Bt.mouseOver())
    { this.gMode0Bt.selected = true; }
    else if(this.gMode1Bt.mouseOver())
    { this.gMode1Bt.selected = true; }
    
    else if(this.playBt.mouseOver())
    { this.playBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.backBt.mouseOver() && this.backBt.selected)
    { changeMode = 0; }
    
    else if(this.minusBt.mouseOver() && this.minusBt.selected)
    {
      this.dimensions--;
      if(this.dimensions < 1)
      { this.dimensions = 1; }
      if(this.players > this.dimensions)
      {
        this.players = this.dimensions;
        this.playersBt.label = str(this.players);
      }
      this.dimensionsBt.label = str(this.dimensions);
    }
    else if(this.plusBt.mouseOver() && this.plusBt.selected)
    {
      this.dimensions++;
      this.dimensionsBt.label = str(this.dimensions);
    }
    
    else if(this.playerMinusBt.mouseOver() && this.playerMinusBt.selected)
    {
      this.players--;
      if(this.players < 1)
      { this.players = 1; }
      this.playersBt.label = str(this.players);
    }
    else if(this.playerPlusBt.mouseOver() && this.playerPlusBt.selected)
    {
      this.players++;
      if(this.players > this.dimensions)
      { this.players = this.dimensions; }
      this.playersBt.label = str(this.players);
    }
    
    else if(this.gMode0Bt.mouseOver() && this.gMode0Bt.selected)
    {
      this.gMode1Bt.selected = false;
      this.gameMode = 0;
    }
    else if(this.gMode1Bt.mouseOver() && this.gMode1Bt.selected)
    {
      this.gMode0Bt.selected = false;
      this.gameMode = 1;
    }
    
    else if(this.playBt.mouseOver() && this.playBt.selected)
    { changeMode = 1; }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  {
    this.backBt.selected = false;
    this.minusBt.selected = false;
    this.plusBt.selected = false;
    this.playerPlusBt.selected = false;
    this.playerMinusBt.selected = false;
    this.playBt.selected = false;
  }
}
