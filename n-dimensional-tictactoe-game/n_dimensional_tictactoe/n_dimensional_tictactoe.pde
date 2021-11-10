/* 
https://github.com/dennisgunter/n-dimensional-tictactoe
begin: 06.11.21
last updated 06.11.21
*/

int mode=1, changeMode=1;

MainMenue mm;
Game game;

void setup()
{
  size(500,500);
  orientation(PORTRAIT);
  
  mm = new MainMenue();
  game = new Game();
}



void draw()
{
  background(#f2ecf9);
  
  switch (mode)
  {
    case 0: mm.draw()    ;
    case 1: game.draw()  ;
  }
  
  if(mode != changeMode)
  {
    if(changeMode == 0)
    { mm.refresh(); }
    else if(changeMode == 1)
    { game = new Game(); }
    mode = changeMode;
  }
}

void mousePressed()
{
  switch (mode)
  {
    case 0: mm.mousePressed()    ;
    case 1: game.mousePressed()  ;
  }
}
