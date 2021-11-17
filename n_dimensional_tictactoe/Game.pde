class Game
{
  int dimensions;
  int counter;
  
  Button backBt;
  Gamefield gamefield;
  
  Game(int dimensions)
  { 
    this.backBt = new Button(width/2-width/50*4, width/50*4, width/50*8, "|||");
    
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
  }
  
  void draw()
  {
    if(counter % 60 == 0)
    { this.gamefield.setPlayer_Field(-1, (int) random(gamefield.fields-1), gamefield.players[(int) random(this.dimensions)]); }
    
    this.gamefield.show();
    
    counter++;
    
    this.backBt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    { this.backBt.selected = true; }
  }
  void mouseReleased()
  {
    if(this.backBt.mouseOver() && this.backBt.selected)
    {
      backGroundIMG = get();
      changeMode = 5;
    }
    
    this.unselectButtons();
  }
  
  void unselectButtons()
  { this.backBt.selected = false; }
}
