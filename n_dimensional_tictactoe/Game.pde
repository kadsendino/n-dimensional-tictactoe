class Game
{
  int dimensions, gameMode, counter;
  
  Button menueBt;
  Gamefield gamefield;
  
  Game(int dimensions, int gameMode)
  { 
    this.menueBt = new Button(width/50*4, width/50*4, width/50*8, "|||");
    
    this.dimensions = dimensions;
    int x,y,w,h;
    
    if(dimensions % 2 == 0)
    {
      x = width/10;
      w = width - width/5;
      y = height/2 - w/2;
      h = w;
    }
    else
    {
      x = width/4;
      w = width/2;
      y = height/2 - (w*3)/2;
      h = w*3;
    }
    
    this.gamefield = new Gamefield(x, y, w, h, dimensions);
    
    this.gameMode = gameMode;
  }
  
  void draw()
  {
    if(frameCount % 60 == 0)
    { 
      boolean enter=true;
      int field = -2;
      while(enter == true)
      {
        enter = false;
        field = (int) random(gamefield.fields-1);
        for(Player player : gamefield.players)
        {
          for(int i : player.fields)
          {
            if(i == field)
            { enter = true; }
          }
        }
      }
      this.gamefield.setPlayer_Field(-1, field, gamefield.players[counter]);
      counter++;
      counter %= this.dimensions;
      /*if(counter == this.dimensions)
      { counter = 0; }*/
    }
    
    this.gamefield.show();

    this.menueBt.draw();
  }
  
  void mousePressed()
  {
    if(this.menueBt.mouseOver())
    { this.menueBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.menueBt.mouseOver() && this.menueBt.selected)
    {
      backGroundIMG = get();
      changeMode = 5;
    }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  { this.menueBt.selected = false; }
}
