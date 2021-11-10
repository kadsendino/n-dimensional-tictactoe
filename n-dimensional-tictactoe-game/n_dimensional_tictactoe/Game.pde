class Game
{
  int dim;
  Gamefield field;
  Player p;
  
  Game()
  {
   dim = 4;
   field = new Gamefield(dim);
   field.setCoords(100,100,300,300);
   p = new Player(3);
   background(255);
   
  }
  void draw()
  {
    field.show();
    p.show(100,100,300,300,5);
  }
  void mousePressed(){}
}
