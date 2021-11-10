class Player{
    int player_id=0;
    
    Player(int player_id)
    {
      this.player_id = player_id;
    }
    
    void show(int x,int y, int h, int w,int stroke_width)
    {
      if (this.player_id==0){}
      else if (this.player_id==1)
      {
        noFill();
        strokeWeight(stroke_width);
        stroke(0);
        ellipse(x+w/2,y+h/2,h,w);
      }
      else if (this.player_id==2)
      {
        strokeWeight(stroke_width);
        stroke(0);
        line(x,y,x+w,y+h);
        line(x,y+h,x+w,y);
      }
      else
      {
        noFill();
        strokeWeight(stroke_width);
        stroke(0);
        float angle = TWO_PI / player_id;
        beginShape();
        for (float a = 0; a < TWO_PI; a += angle) 
        {
          float sx = x + (w/2) - cos(a +PI/2) * (w/2.5);
          float sy = y + (h/2) - sin(a +PI/2) * (h/2.5);
          vertex(sx, sy);
        }
        endShape(CLOSE);
      }
    }
}
