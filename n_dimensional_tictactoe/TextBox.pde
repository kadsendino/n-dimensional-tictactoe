class TextBox extends Button
{
  String spaceHolder;
  TextBox(float x, float y, float w, float h, String label, String spaceHolder)
  {
    super(x, y, w, h, label);
    this.spaceHolder = spaceHolder;
  }
  
  void draw()
  {
    stroke(secCol);
    strokeWeight(this.st);
    fill(primCol);
    rect(this.x, this.y, this.w, this.h, corner1, corner2, corner3, corner4);
    
    fill(secCol);
    textAlign(CENTER, CENTER);
    textSize(this.h/3);
    if(this.label.equals(""))
    { text(this.spaceHolder, this.x+this.w/2, this.y+this.h/2); }
    else
    { text(this.label, this.x+this.w/2, this.y+this.h/2); }
    
    if(this.selected)
    {
      noStroke();
      fill(secCol, 100);
      rect(this.x, this.y, this.w, this.h, corner1, corner2, corner3, corner4);
    }
  }
  
  void keyPressed()
  {
    if((key >= '0' && key <= '9') || (key >= 'a' && key <= 'f') || (key >= 'A' && key <= 'F'))
    { this.label += key;}
    else if(key == BACKSPACE)
    { createDevMessage("backspace");this.label.substring(this.label.length()-1); }
  }
}
