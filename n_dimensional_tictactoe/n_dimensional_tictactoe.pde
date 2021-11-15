/* 
https://github.com/dennisgunter/n-dimensional-tictactoe
begin: 06.11.21
last updated: 13.11.21
*/

int mode=0, changeMode=0, fade=0;
String errorText="";
color primCol=#f2ecf9, secCol=#0d1306;
Boolean devSettings=false;

PImage m1logoLightIMG, m1logoDarkIMG;

MainMenue mm;
Game game;
Settings settings;
PreGameMenue pgm;
About about;
SetupGameMenue sgm;

void setup()
{
  fullScreen();
  orientation(PORTRAIT);
  
  m1logoLightIMG = loadImage("m1logoLight.png");
  m1logoDarkIMG = loadImage("m1logoDark.png");
  
  mm = new MainMenue();
  game = new Game(0);
  settings = new Settings();
  pgm = new PreGameMenue();
  about = new About();
  sgm = new SetupGameMenue();
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
  else if(mode == 5)
  { sgm.draw(); }
  
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
  else if(mode == 5)
  { sgm.mousePressed(); }
  
  fade -= 30;
}

void switchMode()
{
  if(changeMode == 0)
  { mm.refresh(); }
  else if(changeMode == 1)
  { game = new Game(sgm.dimensions); } //it is expected that you want to start a new game here, if not: mode = 1; changeMode = 1;
  else if(changeMode == 2)
  { settings.refresh(); }
  else if(changeMode == 3)
  { pgm.refresh(); }
  else if(changeMode == 4)
  { about.refresh(); }
  else if(changeMode == 5)
  { sgm.refresh(); }
  else
  {
    createError("ERROR : 00 : "+changeMode);
    changeMode = mode;
  }
  mode = changeMode;
  
  if(devSettings)
  { createError(str(mode)); }
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

void clearErrors()
{
  fade = 0;
  errorText = "";
}
