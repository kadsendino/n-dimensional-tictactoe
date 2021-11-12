class Game
{
  int dim;
  Gamefield field;
  Player p;
  
  Game()
  {
   dim = 5;
   field = new Gamefield(width/2 - 266/2,50,266,800,dim);
   p = new Player(9);
   background(255);
   
  }
  void draw()
  {
    field.setPlayerOnField(0,p);
    field.show();
    //p.show(100,100,300,300,20);
  }
  void mousePressed(){}
  
  
}
