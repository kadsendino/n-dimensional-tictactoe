/* 
https://github.com/dennisgunter/n-dimensional-tictactoe
begin: 06.11.21
last updated: 31.01.22
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
ColorAjustment ca;
TutorialMenue tm;

void setup()
{
  fullScreen();
  orientation(PORTRAIT);
  
  m1logoIMG = loadImage("m1logoDark.png");
  
  fileM = new FileManager();
  ArrayList <String> content = fileM.readFile("stats.ndttt");
  stats = new Statistics(int(content.get(0)), int(content.get(1)));

  mm = new MainMenue();
  game = new Game(0,0,0);
  settings = new Settings();
  prgm = new PreGameMenue();
  about = new About();
  igm = new InGameMenue();
  pogm = new PostGameMenue();
  ca = new ColorAjustment();
  tm = new TutorialMenue();
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
  else if(mode == 8)
  { ca.draw(); }
  else if(mode == 9)
  { tm.draw(); }
  
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
  else if(mode == 8)
  { ca.mousePressed(); }
  else if(mode == 9)
  { tm.mousePressed(); }
  
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
  else if(mode == 8)
  { ca.mouseReleased(); }
  else if(mode == 9)
  { tm.mouseReleased(); }
}

void keyPressed()
{
  if(mode == 8)
  { ca.keyPressed(); }
}

void switchMode()
{
  if(changeMode == 0) {} //mainMenue
  else if(changeMode == 1)
  {
    game = new Game(prgm.dimensions, prgm.gameMode, prgm.players); //it is expected that you want to start a new game here, if not: mode = 1; changeMode = 1;
    if(devSettings)
    { createError("game mode:" +prgm.gameMode); }
  }
  else if(changeMode == 2) {} //settings
  else if(changeMode == 3) {} //preGameMenue
  else if(changeMode == 4) {} //about
  else if(changeMode == 5) {} //inGameMenue
  else if(changeMode == 6) {} //stats
  else if(changeMode == 7) //PostGameMenue
  { pogm.refresh(); } 
  else if(changeMode == 8){} //ColorAjustment
  else if(changeMode == 9) //Tutorial
  { tm.refresh(); }
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
void createDevMessage(String message)
{
  if(devSettings)
  { createError(message); }
}

void clearErrors()
{
  fade = 0;
  errorText = "";
}

void quitGame()
{ System.exit(0); }
