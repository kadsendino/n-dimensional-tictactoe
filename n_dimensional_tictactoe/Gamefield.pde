int ndivide(int a,int b,int n)
{
  for(int i=0;i<n;i++)
  {
    a = (a/b);
  }
  return a;
}

int power(int a,int b)
{
  int erg = 1;
  for(int i=0;i<b;i++)
  {
    erg *= a;
  }
  return erg;
}


class Gamefield
{
  int dim;
  int even_dim,odd_dim;
  Field[] fields;
  Field[] fields_with_players;
  Field selectedField;
  boolean field_is_selected;
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

    this.dim = dim;
    this.even_dim = dim/2;
    this.odd_dim = (dim+1)/2;
    
    this.field_w = w/power(3,this.even_dim);
    this.field_h = h/power(3,this.odd_dim);
    
    this.fields = create_n_dimensional_array(dim);
    
    int odd_counter=0;
    int even_counter=0;
    for(int i=0;i<dim;i++)
    {
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

  Field[] create_n_dimensional_array(int dim)
  {
    int[] coords = new int[dim];  // will be saved by [1D,2D,3D ... ND]
    
    float x,y,h,w;
    x=this.x;
    y=this.y;
    w=this.field_w;
    h=this.field_h;
    
    fields = new Field[power(3,dim)];
   
    for(int index=0;index<fields.length;index++)
    {
      int odd_counter=0;
      int even_counter=0;
      x=this.x;
      y=this.y;
      
      for(int j=0;j<dim;j++)
      {
        coords[j] = ndivide(index,3,j) % 3;
        
        if(j % 2 == 0) //  dim -> odd
        {
         y += coords[j] * h * power(3,odd_counter);
         odd_counter++;
        }
        else if(j % 2 == 1) // dim -> even
        {
         x += coords[j] * w * power(3,even_counter);
         even_counter++;
        }
        
      }
      fields[index] = new Field(x,y,w,h,index,coords);
      
    }
    return fields;
  }
  
  void show()
  {    
    fill(0);
    noStroke();
    
    for(int i=1;i<this.even_lines+1;i++)
    {
      int strokeWidth = 1;
      for(int j=0;j<even_dim;j++)
      {
        if (i % power(3,j) == 0)
        {
          strokeWidth *= 2;
        }
      }
      rect(x + i*field_w - strokeWidth/2, y , strokeWidth,h);
    }
    
    for(int i=1;i<this.odd_lines+1;i++)
    {
      int strokeWidth = 1;
      for(int j=0;j<odd_dim;j++)
      {
        if (i % power(3,j) == 0)
        {
          strokeWidth *= 2;
        }
      }
      rect(x , y + i*field_h - strokeWidth/2, w , strokeWidth);
    }

    noFill();
    strokeWeight(1);
    rect(x,y,w,h);
    
    for(Field field:fields)
    {
      field.show(false);
    }
  }
  
  void setPlayerOnField(int field_index,Player player)
  {
    this.fields[field_index].setPlayer(player);
  }

}
