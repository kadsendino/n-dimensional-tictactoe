class ColorAjustment extends Menue
{
  Button resetBt;
  TextBox primColTBx, secColTBx;
  
  ColorAjustment()
  {
    super();
    
    this.primColTBx = new TextBox(this.x+this.w/2-this.w/3, this.y+this.w/5, this.w/1.5, this.w/5, "", hex(primCol, 6));
    this.secColTBx = new TextBox(this.x+this.w/2-this.w/3, this.y+this.w/5*2.5, this.w/1.5, this.w/5, "", hex(secCol, 6));
    
    this.resetBt = new Button(this.x+this.w/2-this.w/3, this.y+this.w/5*7, this.w/1.5, this.w/5, "RESET");
  }
  
  void draw()
  {
    super.draw();
    
    this.primColTBx.draw();
    this.secColTBx.draw();
    
    this.resetBt.draw();
  }
  
  void mousePressed()
  {
    if(this.primColTBx.mouseOver())
    { this.primColTBx.selected = true; }
    else if(this.secColTBx.mouseOver())
    { this.secColTBx.selected = true; }
    else if(this.resetBt.mouseOver())
    { this.resetBt.selected = true; }
    else
    { super.mousePressed(); }
  }
  
  void mouseReleased()
  {
    if(this.primColTBx.mouseOver() && this.primColTBx.selected)
    { openKeyboard(); }
    else if(this.secColTBx.mouseOver() && this.secColTBx.selected)
    { openKeyboard(); }
    else if(super.mouseUp()){}
    else if(this.resetBt.mouseOver() && this.resetBt.selected)
    {
      primCol = #f2ecf9;
      this.primColTBx.label = "";
      secCol = #0d1306;
      this.primColTBx.label = "";
    }
  }
  
  void keyPressed()
  {
    if(this.primColTBx.selected)
    {
      this.primColTBx.keyPressed();
      if(this.primColTBx.label.length() == 6)
      //{ primCol = color(int(this.primColTBx.label)); }
      {  }
    }
    else if(this.secColTBx.selected)
    {
      this.secColTBx.keyPressed();
      if(this.secColTBx.label.length() == 6)
      //{ secCol = color(int(this.secColTBx.label)); }
      {  }
    }
  }
  
  void unselectButtons()
  {
    super.unselectButtons();
    this.resetBt.selected = false;
    this.primColTBx.selected = false;
    this.secColTBx.selected = false;
    closeKeyboard();
  }
}
