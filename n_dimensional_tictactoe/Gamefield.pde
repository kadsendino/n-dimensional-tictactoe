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
  
  int player_counter;
  Player[] players;
  
  int show_dim;
  int even_dim, odd_dim;
  float x, y, w, h;
  float field_w, field_h;
  int even_lines=0;
  int odd_lines=0;
  
  int selected_field;
  boolean valid_selection;
  
  int pressed_field;
  String winner;

  Gamefield(float x, float y, float w, float h, int dim)
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
    
    this.player_counter = 0;
    this.selected_field = -1;
    this.valid_selection = false;
    
    this.pressed_field = -1;
    this.winner = "";
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
  
  int getIndex(int x_pos , int y_pos)
  {
    x_pos -= this.x;
    y_pos -= this.y;
    
    x_pos /= this.field_w;
    y_pos /= this.field_h;
    
    int odd_counter=odd_dim-1;
    int even_counter=even_dim-1;
    int[] coords =  new int[this.dim];
    
    for(int j=dim-1;j>=0;j--)
    {
      
      if(j % 2 == 0) //  dim -> odd
      {
        coords[j] = y_pos / power(3,odd_counter);
        y_pos -= coords[j] * power(3,odd_counter);
        odd_counter--;
      }
      else if(j % 2 == 1) // dim -> even
      {
        coords[j] = x_pos / power(3,even_counter);
        x_pos -= coords[j] * power(3,even_counter);
        even_counter--;
      }
    }
    
    int index=0;
    for(int i=0;i<coords.length;i++)
    {
      index += coords[i] * power(3,i);
    }
    return index;
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
    
    if(this.selected_field != -1)
    {
      float[] selectedField_pos = getPosition_Field(this.dim,this.selected_field,this.x,this.y,this.field_w,this.field_h);
      noStroke();
      fill(secCol, 50);
      rect(selectedField_pos[0],selectedField_pos[1],selectedField_pos[2],selectedField_pos[3]);
    }
    
    if(this.pressed_field != -1 && this.pressed_field != this.selected_field)
    {
      float[] selectedField_pos = getPosition_Field(this.dim,this.pressed_field,this.x,this.y,this.field_w,this.field_h);
      noStroke();
      fill(secCol, 50);
      rect(selectedField_pos[0],selectedField_pos[1],selectedField_pos[2],selectedField_pos[3]);
    }
    
    for(Player player:players)
    { showPlayer_Field(player); }
  }
  
  void setPlayer_Field(int old_index, int new_index, Player player)
  { player.setField(old_index, new_index); }
  
  boolean make_turn(int old_index, int new_index) // returns if turn was valid
  {
    if(new_index != this.pressed_field)
    {
      return false;
    }
    
    boolean nonegative=false;
    if(old_index == -1)
    {
      nonegative=true;
      for(int i:this.players[player_counter].fields)
      {
        if(i==-1)
        {
          nonegative = false;
        }
      }
    }
    if(nonegative)
    {
      return false;
    }
    
    int stone=0;
    for(Player player:this.players)
    {
      for(int i:player.fields)
      {
        if(i == new_index)
        {
          return false;
        }
      }
    }

    for(int i=0;i<this.players[player_counter].fields.length;i++)
    {
      if(this.players[player_counter].fields[i] == old_index)
      {
        stone = i;
      }
    }
    this.setPlayer_Field(this.players[player_counter].fields[stone],new_index, this.players[player_counter]);
    if(this.check_winner(this.players[player_counter]))
    {
      this.winner = "PLAYER " + (player_counter+1);
    }
    else
    {
      this.player_counter++;
      if(this.player_counter == this.players.length) 
      {
        this.player_counter = 0;
      }
    }
    return true;
  }
  
  void manage_turn(int x_pos, int y_pos)
  {
    int index = this.getIndex(x_pos , y_pos);
    
    for(int field:this.players[player_counter].fields)
    {
      if(field == index)
      {
        this.selected_field = index;
        this.valid_selection = true;
        return;
      }
    }
    
    for(int field:this.players[player_counter].fields)
    {
      if(field == -1)
      {
        this.selected_field = -1;
        this.valid_selection = true; 
      }
    }
    
    this.make_turn(this.selected_field,index);
    this.selected_field = -1;
    this.valid_selection = false;
    
  }
  
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
  
  boolean mouseOver()
  { return((this.x<=mouseX && this.x+this.w>=mouseX) && (this.y<=mouseY && this.y+this.h>=mouseY)); }
  
  void unPress()
  {
    this.pressed_field = -1;
  }
  
  void press(int x_pos,int y_pos)
  {
    int index = this.getIndex(x_pos , y_pos);
    this.pressed_field = index;
  }
  
  boolean check_winner(Player player)
  {
    int[] sum_coords = new int[this.dim]; 
    for(int field:player.fields)
    {
      int[] coords = this.getCoords_Field(this.dim , field);
      for(int i=0;i<coords.length;i++)
      {
        if(coords[i] == -1)
        {
          return false;
        }
        sum_coords[i] += coords[i];
      }
    }
    for(int i=0;i<sum_coords.length;i++)
    {
      if(sum_coords[i] % 3 != 0)
      {
        return false;
      }
    }
    player.highlight = true;
    return true;
  }
}
