class Game
{
  int dim;
  Gamefield field;
  
  Game()
  {
   dim = 4;
   field = new Gamefield(dim);
   field.setCoords(100,100,300,300);
   background(255);
  }
  void draw()
  {
    field.show();
  }
  void mousePressed(){}
}
