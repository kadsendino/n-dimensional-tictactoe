class Player
{
  int player_id=0;
  int[] fields;
  boolean highlight=false;
  boolean bot;
  
  Player(int player_id,boolean bot)
  {
    this.bot = bot;
    this.player_id = player_id;
    this.fields = new int[3];
    for(int i=0;i<fields.length;i++)
    { fields[i] = -1; }
  }
  
  void setField(int old_index, int new_index)
  {
    for(int i=0; i<fields.length; i++)
    {
      if(fields[i] == old_index)
      {
        fields[i] = new_index;
        return;
      }
    }
  }
  
  int[] getFields()
  { return this.fields; }
  
  void show(float x,float y, float w, float h, float stroke_width)
  {
    noFill();
    strokeWeight(stroke_width);
    if(this.highlight)
    { stroke(#ff0000); }
    else
    { stroke(secCol); }
    if (this.player_id==0){}
    else if (this.player_id==1)
    {
      float xscale = w/4;
      float yscale = w/4;
      
      ellipse(x+w/2,y+h/2,w-xscale,h-yscale);
    }
    else if (this.player_id==2)
    {
      float xscale = w/5;
      float yscale = w/5;

      line(x+xscale,y+yscale,x+w-xscale,y+h-yscale);
      line(x+xscale,y+h-yscale,x+w-xscale,y+yscale);
    }
    else
    {
      float angle = TWO_PI / player_id;
      float[] xs = new float[player_id];
      float[] ys = new float[player_id];
      int index = 0;
      
      
      for (float a = 0; a < TWO_PI; a += angle) 
      {
        if (index < xs.length)
        {
           xs[index] = x  - cos(a +PI/2) * (w/2.5);
           ys[index] = y  - sin(a +PI/2) * (h/2.5);
        }
        
        index++;
      }
      
      float ycenteroffset = (abs(min(ys)-y) + abs(max(ys)-(y+h)))/2;
      float xcenteroffset = (abs(min(xs)-x) + abs(max(xs)-(x+w)))/2;
      
      beginShape();
      for(int i=0;i<xs.length;i++)
      { vertex(xs[i] + xcenteroffset, ys[i] + ycenteroffset); }
      endShape(CLOSE);
    }
  }
   

}
