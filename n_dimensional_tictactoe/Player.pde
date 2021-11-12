class Player{
    int player_id=0;
    
    Player(int player_id)
    {
      this.player_id = player_id;
    }
    
    void show(float x,float y, float h, float w,float stroke_width)
    {
      if (this.player_id==0){}
      else if (this.player_id==1)
      {
        float xscale = w/5;
        float yscale = w/5;
        
        noFill();
        strokeWeight(stroke_width);
        stroke(0);
        ellipse(x+w/2,y+h/2,w-xscale,h-yscale);
      }
      else if (this.player_id==2)
      {
        float xscale = w/5;
        float yscale = w/5;
        
        strokeWeight(stroke_width);
        stroke(0);
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
        
        noFill();
        strokeWeight(stroke_width);
        stroke(0);
        
        beginShape();
        for(int i=0;i<xs.length;i++)
        {
          vertex(xs[i] + xcenteroffset, ys[i] + ycenteroffset);
        }
        endShape(CLOSE);
        
      }
    }
}
