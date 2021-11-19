/* 
https://github.com/dennisgunter/n-dimensional-tictactoe
begin: 06.11.21
last updated: 19.11.21
*/

int mode=0, changeMode=0, fade=0;
String errorText="";
color primCol=#f2ecf9, secCol=#0d1306;
Boolean devSettings=false;

PImage m1logoIMG, backGroundIMG;
FileManager fileM;

MainMenue mm;
Game game;
Settings settings;
PreGameMenue prgm;
About about;
InGameMenue igm;
Statistics stats;
PostGameMenue pogm;

void setup()
{
  //size(400,900);
  fullScreen();
  orientation(PORTRAIT);
  
  m1logoIMG = loadImage("m1logoDark.png");
  
  fileM = new FileManager();
  ArrayList <String> content = fileM.readFile("stats.ndttt");
  stats = new Statistics(int(content.get(0)), int(content.get(1)));
  //stats = new Statistics(0,0);
  
  mm = new MainMenue();
  game = new Game(0,0);
  settings = new Settings();
  prgm = new PreGameMenue();
  about = new About();
  igm = new InGameMenue();
  pogm = new PostGameMenue();
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
  { prgm.draw(); }
  else if(mode == 4)
  { about.draw(); }
  else if(mode == 5)
  { igm.draw(); }
  else if(mode == 6)
  { stats.draw(); }
  else if(mode == 7)
  { pogm.draw(); }
  
  if(fade > 0)
  { printError(); }
  
  if(mode != changeMode)
  { switchMode(); }
}

void onBackPressed()
{
  if(mode == 0)
  { quitGame(); }
  changeMode = 0;
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
  { prgm.mousePressed(); }
  else if(mode == 4)
  { about.mousePressed(); }
  else if(mode == 5)
  { igm.mousePressed(); }
  else if(mode == 6)
  { stats.mousePressed(); }
  else if(mode == 7)
  { pogm.mousePressed(); }
  
  fade -= 30;
}
void mouseReleased()
{
  if(mode == 0)
  { mm.mouseReleased(); }
  else if(mode == 1)
  { game.mouseReleased(); }
  else if(mode == 2)
  { settings.mouseReleased(); }
  else if(mode == 3)
  { prgm.mouseReleased(); }
  else if(mode == 4)
  { about.mouseReleased(); }
  else if(mode == 5)
  { igm.mouseReleased(); }
  else if(mode == 6)
  { stats.mouseReleased(); }
  else if(mode == 7)
  { pogm.mouseReleased(); }
}

void switchMode()
{
  if(changeMode == 0) {} //mainMenue
  else if(changeMode == 1)
  {
    game = new Game(prgm.dimensions, prgm.gameMode); //it is expected that you want to start a new game here, if not: mode = 1; changeMode = 1;
    if(devSettings)
    { createError("game mode:" +prgm.gameMode); }
  }
  else if(changeMode == 2) {} //settings
  else if(changeMode == 3) {} //preGameMenue
  else if(changeMode == 4) {} //about
  else if(changeMode == 5) {} //inGameMenue
  else if(changeMode == 6) {} //stats
  else if(changeMode == 7) {} //PostGameMenue
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

void quitGame()
{
  System.exit(0);
}
