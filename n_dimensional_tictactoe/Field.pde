
class Field
{
  int index;
  int[] coords;
  int x,y,w,h;
  boolean selected;
  color selectedColor;
  Player player;


  Field(int x,int y,int w,int h,int index,int[] coords)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.index = index;
    this.coords = coords;
  }
  
  void setPlayer(Player player)
  {
    this.player = player;
  }
  
    void setSelected(boolean selected)
  {
    this.selected = selected;
  }
  
  void show()
  {
    if(selected)
    {
      noStroke();
      fill(selectedColor);
      rect(x,y,w,h);
    }
    if(player!=null)
    {
      player.show(x,y,h,w,20);
    }
    
    
  }




}
