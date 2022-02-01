class TutorialMenue extends Menue
{
  Button continueBt;
  String[] tutorialTxt = {"It's ordinary\nTicTacToe","But you only\nhave 3 pieces","And you can\nstack it"};
  int curText=0, tutorialDimensions=2;
  Gamefield tutorialTicTacToe;
  
  TutorialMenue()
  {
    super();
    
    this.backBt.label = "MENU";
    
    this.continueBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*7, this.w/1.5, this.w/5, "CONTINUE");

    this.tutorialTicTacToe = new Gamefield(width/10, this.y+this.h/7.5, width/5*4, width/5*4, this.tutorialDimensions);
  }
  
  void refresh()
  {
    this.curText = 0;
    this.tutorialDimensions = 2;
    this.tutorialTicTacToe = new Gamefield(width/10, this.y+this.h/7.5, width/5*4, width/5*4, this.tutorialDimensions);
  }
  
  void draw()
  {
    textSize(this.h/20);
    textAlign(CENTER,CENTER);
    fill(secCol);
    text(tutorialTxt[this.curText], this.x+this.w/2, this.y+this.h/20);
    createDevMessage(str(this.curText));
    
    super.draw();
    
    this.tutorialTicTacToe.show();
    
    this.continueBt.draw();
  }
  
  void mousePressed()
  {
    super.mousePressed();
    
    if(this.continueBt.mouseOver())
    { this.continueBt.selected = true; }
    
    else if(this.tutorialTicTacToe.mouseOver())
    { this.tutorialTicTacToe.press(mouseX,mouseY); }
  }
  void mouseReleased()
  {
    if(this.continueBt.mouseOver())
    {
      createDevMessage("next?");
      if(this.curText < this.tutorialTxt.length-1)
      {this.curText ++; createDevMessage("next!!");}
    }
    
    else if(this.tutorialTicTacToe.mouseOver())
    { 
      this.tutorialTicTacToe.manage_turn(mouseX,mouseY);
      if(this.tutorialTicTacToe.players[0].fields[1] != (-1)) //first player has 2 pieces on the field
      {
        if(this.curText < this.tutorialTxt.length-1)
        {this.curText ++; createDevMessage("next!!");}
      }
      if(this.tutorialTicTacToe.players[0].fields[2] != (-1) || this.tutorialDimensions > 2)
      {
        this.tutorialDimensions ++;
        float xt, wt, yt, ht;
        if(tutorialDimensions % 2 == 0)
        {
          xt = width/10;
          wt = width - width / 5;
          yt = height/2 - w/2;
          ht = w;
        }
        else
        {
          xt = width/4;
          wt = width - width / 2;
          yt = height/2 - (3*w)/2;
          ht = 3*w;
        }
        this.tutorialTicTacToe = new Gamefield(xt, yt, wt, ht, this.tutorialDimensions);
      }
    }
    this.tutorialTicTacToe.unPress();
    super.mouseUp();
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.continueBt.selected = false;
  }
}
