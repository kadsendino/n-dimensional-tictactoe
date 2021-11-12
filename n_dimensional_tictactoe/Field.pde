
class Field
{
  int index;
  int[] coords;
  float x,y,w,h;
  color selectedColor;
  Player player;


  Field(float x,float y,float w,float h,int index,int[] coords)
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
  
  void show(boolean field_is_selected)
  {
    if(field_is_selected)
    {
      noStroke();
      fill(selectedColor);
      rect(x,y,w,h);
    }
    if(player!=null)
    {
      player.show(x,y,h,w,w/20);
    }
    
    
  }




}
