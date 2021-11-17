int ndivide(int a,int b,int n)
{
  for(int i=0;i<n;i++)
  { a /= b; }
  return a;
}

int power(int a,int b)
{
  int erg = 1;
  for(int i=0;i<b;i++)
  { erg *= a; }
  return erg;
}


class Gamefield
{
  int dim;  // Dimensions
  int fields;
  
  Player[] players;
  
  int show_dim;
  int even_dim,odd_dim;
  float x,y,w,h;
  float field_w,field_h;
  int even_lines=0;
  int odd_lines=0;
   

  Gamefield(float x,float y,float w,float h,int dim)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.fields = power(3,dim);

    this.dim = dim;
    this.show_dim = dim;
    this.even_dim = dim/2;
    this.odd_dim = (dim+1)/2;
    
    this.field_w = w/power(3,this.even_dim);
    this.field_h = h/power(3,this.odd_dim);
    
    this.players = new Player[dim];
    
    int odd_counter=0;
    int even_counter=0;
    for(int i=0;i<dim;i++)
    {
      players[i] = new Player(i+1);       
    
      if(i % 2 == 0) //  dim -> odd
      {
       this.odd_lines += 2 * power(3,odd_counter);
       odd_counter++;
      }
      else if(i % 2 == 1) // dim -> even
      {
       this.even_lines += 2 * power(3,even_counter);
       even_counter++;
      }
    }
  }

  int[] getCoords_Field(int dim,int index)
  {
    int[] coords = new int[dim];  // will be saved by [1D,2D,3D ... ND]
    
    for(int j=0;j<dim;j++)
    { coords[j] = ndivide(index,3,j) % 3; }
      
    return coords;
  }
  
  float[] getPosition_Field(int dim,int index,float field_x,float field_y,float field_w,float field_h)
  {
    float[] position = new float[4]; //with [x,y,h,w]
    int[] coords = new int[dim];
    
    position[0]=field_x;
    position[1]=field_y;
    position[2]=field_w;
    position[3]=field_h;
    
    int odd_counter=0;
    int even_counter=0;
    
    for(int j=0;j<dim;j++)
    {
      coords[j] = ndivide(index,3,j) % 3;
      
      if(j % 2 == 0) //  dim -> odd
      {
       position[1] += coords[j] * field_h * power(3,odd_counter);
       odd_counter++;
      }
      else if(j % 2 == 1) // dim -> even
      {
       position[0] += coords[j] * field_w * power(3,even_counter);
       even_counter++;
      }
    }
    
    return position;
  }
  
  void show()
  {    
    fill(secCol);
    noStroke();
    
    for(int i=1;i<this.even_lines+1;i++)
    {
      int strokeWidth = 1;
      for(int j=0;j<even_dim;j++)
      {
        if (i % power(3,j) == 0)
        { strokeWidth *= 2; }
      }
      rect(x + i*field_w - strokeWidth/2, y , strokeWidth,h);
    }
    
    for(int i=1;i<this.odd_lines+1;i++)
    {
      int strokeWidth = 1;
      for(int j=0;j<odd_dim;j++)
      {
        if (i % power(3,j) == 0)
        { strokeWidth *= 2; }
      }
      rect(x , y + i*field_h - strokeWidth/2, w , strokeWidth);
    }
    
    for(Player player:players)
    { showPlayer_Field(player); }
  }
  
  void setPlayer_Field(int old_index, int new_index, Player player)
  { player.setField(old_index, new_index); }
  
  void showPlayer_Field(Player player)
  {
    for (int i:player.getFields())
    {
      if(i!=-1)
      {
        float[] position = getPosition_Field(dim,i,x,y,field_w,field_h);
        player.show(position[0],position[1],position[2],position[3],12/dim);
      }
    }
  }
}
