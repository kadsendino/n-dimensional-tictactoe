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
    if(counter % 60 == 0)
    { this.gamefield.setPlayer_Field(-1, (int) random(gamefield.fields-1), gamefield.players[(int) random(this.dimensions)]); }
    
    this.gamefield.show();
    
    counter++;
    
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
