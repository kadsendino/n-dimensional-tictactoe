class Game
{
  int dimensions, gameMode, counter, players;
  
  Button menueBt;
  Gamefield gamefield;
  
  Game(int dimensions, int gameMode, int players)
  {
    this.menueBt = new Button(width - width/50*4 - width/50*8 , width/50*4, width/50*8, "|||");
    
    this.dimensions = dimensions;
    int x,y,w,h;
    
    if(dimensions % 2 == 0)
    {
      x = width/10;
      w = width - width / 5;
      y = height/2 - w/2;
      h = w;
    }
    else
    {
      x = width/4;
      w = width - width / 2;
      y = height/2 - (3*w)/2;
      h = 3*w;
    }
    
    this.gamefield = new Gamefield(x,y,w,h,dimensions,players);
    
    this.gameMode = gameMode;
    this.players = players;
  }
  
  void draw()
  {
    gamefield.players[gamefield.player_counter].show(width/6-width/16, width/50*8-width/16, width/8, width/8, height/200);
    
    textSize(height/25);
    textAlign(LEFT,CENTER);
    if(gamefield.players[gamefield.player_counter].highlight)
    { fill(#ff0000); }
    else
    { fill(secCol); }
    text("'s turn", width/6+width/16, width/50*8);
    
    this.gamefield.show();

    this.menueBt.draw();
    
    if(gamefield.players[gamefield.player_counter].bot)
    {
      gamefield.manage_bot_turn();
    }
    
    if(this.gamefield.winner != "")
    {
      pogm.winner = this.gamefield.winner;
      backGroundIMG = get();
      changeMode = 7;
    }
  }
  
  void mousePressed()
  {
    if(this.menueBt.mouseOver())
    { this.menueBt.selected = true; }
    
    if(this.gamefield.mouseOver() && !gamefield.players[gamefield.player_counter].bot)
    { 
      this.gamefield.press(mouseX,mouseY);
    }
  }
  void mouseReleased()
  {
    if(this.menueBt.mouseOver() && this.menueBt.selected)
    {
      backGroundIMG = get();
      changeMode = 5;
    }
    if(this.gamefield.mouseOver() && !gamefield.players[gamefield.player_counter].bot)
    { 
      this.gamefield.manage_turn(mouseX,mouseY);
    }
    this.gamefield.unPress();
    this.unselectButtons();
    

  }
  
  void unselectButtons()
  { this.menueBt.selected = false; }
}
