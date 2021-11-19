class Game
{
  int dimensions, gameMode, counter;
  
  Button menueBt;
  Gamefield gamefield;
  
  Game(int dimensions, int gameMode)
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
    
    this.gamefield = new Gamefield(x,y,w,h,dimensions);
    
    this.gameMode = gameMode;
  }
  
  void draw()
  {
    /*
    if(frameCount % 60 == 0)
    { 
      int stone=0;
      boolean enter=true;
      int field=-2;
      while(enter == true)
      {
        enter = false;
        field = (int) random(gamefield.fields-1);
        for(Player player:gamefield.players)
        {
          for(int i:player.fields)
          {
            if(i == field)
            {
              enter = true;
            }
          }
        }
      }
      stone=(int) random(0,2);
      for(int i=0;i<gamefield.players[counter].fields.length;i++)
      {
        if(gamefield.players[counter].fields[i] == -1)
        {
          stone = i;
        }
      }
      this.gamefield.setPlayer_Field(gamefield.players[counter].fields[stone],field, gamefield.players[counter]);
      counter++;
      if(counter == this.dimensions) 
      {
        counter = 0;
      }
    }
    */
    
    this.gamefield.show();

    this.menueBt.draw();
    
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
    
    if(this.gamefield.mouseOver())
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
    if(this.gamefield.mouseOver())
    { 
      this.gamefield.manage_turn(mouseX,mouseY);
    }
    this.gamefield.unPress();
    this.unselectButtons();
    

  }
  
  void unselectButtons()
  { this.menueBt.selected = false; }
}
