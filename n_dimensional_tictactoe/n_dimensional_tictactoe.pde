/* 
https://github.com/dennisgunter/n-dimensional-tictactoe
begin: 06.11.21
last updated: 10.11.21
*/

int mode=0, changeMode=0, fade=0;
String errorText="";
color primCol=#f2ecf9, secCol=#0d1306;

MainMenue mm;
Game game;
Settings settings;
PreGameMenue pgm;
About about;

void setup()
{
  fullScreen();
  orientation(PORTRAIT);
  
  mm = new MainMenue();
  game = new Game();
  settings = new Settings();
  pgm = new PreGameMenue();
  about = new About();
}

void draw()
{
  background(primCol);
  
  if(mode == 0)
  { mm.draw(); }
  else if(mode == 1)
  { game.draw(); }
  else if(mode == 2)
  { settings.draw(); }
  else if(mode == 3)
  { pgm.draw(); }
  else if(mode == 4)
  { about.draw(); }
  
  if(fade > 0)
  { printError(); }
  
  if(mode != changeMode)
  { switchMode(); }
}

void mousePressed()
{
  if(mode == 0)
  { mm.mousePressed(); }
  else if(mode == 1)
  { game.mousePressed(); }
  else if(mode == 2)
  { settings.mousePressed(); }
  else if(mode == 3)
  { pgm.mousePressed(); }
  else if(mode == 4)
  { about.mousePressed(); }
  
  fade -= 30;
}

void switchMode()
{
  if(changeMode == 0)
  { mm.refresh(); }
  else if(changeMode == 1)
  { game = new Game(); }
  else if(changeMode == 2)
  { settings.refresh(); }
  else if(changeMode == 3)
  { pgm.refresh(); }
  else if(changeMode == 4)
  { about.refresh(); }
  else
  {
    createError("ERROR : 00 : "+changeMode);
    changeMode = mode;
  }
  mode = changeMode;
}

void printError()
{
  fill(255,0,0, fade);
  textSize(height/40);
  textAlign(CENTER,CENTER);
  text(errorText, width/2, height/2);
  fade --;
}

void createError(String error)
{
  if(fade > 50)
  { errorText = errorText + "\n" + error; }
  else
  { errorText = error; }
  fade = 350;
}
