class Game
{
  int dimensions;
  int counter;
  Gamefield gamefield;  
  Game(int dimensions)
  { 
    this.dimensions = dimensions;
    int x,y,w,h;
    
    if(dimensions % 2 == 0)
    {
     x = width/10;
     w = width - width / 5;
     y = height/2 - w/2;
     h = w;
    } else
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
    {
      this.gamefield.setPlayer_Field(-1,(int) random(0,gamefield.fields-1),gamefield.players[(int) random(0,this.dimensions)]);
    }
    
    this.gamefield.show();
    
    counter++;
  }
  
  void mousePressed()
  {
  }
}
