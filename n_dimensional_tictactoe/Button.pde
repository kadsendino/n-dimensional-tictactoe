class Button
{
  float x, y, w, h, st;
  String label="";
  Boolean selected=false;
  
  Button(float x, float y, float w, String label)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = w;
    this.st = this.h/20;
    this.label = label;
  }
  Button(float x, float y, float w, float h, String label)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.st = this.h/20;
    this.label = label;
  }
  
  void draw()
  {
    stroke(secCol);
    strokeWeight(this.st);
    fill(primCol);
    rect(this.x, this.y, this.w, this.h);
    
    fill(secCol);
    textAlign(CENTER, CENTER);
    textSize(this.h/3);
    text(this.label, this.x+this.w/2, this.y+this.h/2);
    
    if(this.selected)
    {
      noStroke();
      fill(secCol, 100);
      rect(this.x, this.y, this.w, this.h);
    }
  }
  
  boolean mouseOver()
  { return((this.x<=mouseX && this.x+this.w>=mouseX) && (this.y<=mouseY && this.y+this.h>=mouseY)); }
}
