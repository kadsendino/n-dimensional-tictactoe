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
  Field[] fields;
  int[][] fiels;
  int x,y,w,h;


  Gamefield(int dim)
  {
    this.dim = dim;
    this.fields = create_n_dimensional_array(dim);
  }

  Field[] create_n_dimensional_array(int dim)
  {
    int[] coords = new int[dim];
    int interval_w, interval_h;
    int x,y,h,w;
    x=0;
    y=0;
    w=0;
    h=0;
    
    fields = new Field[power(3,dim)];
   
    for(int index=0;index<fields.length;index++)
    {
      for(int j=0;j<dim;j++)
      {
        coords[j] = ndivide(index,3,j) % 3;
      }
      fields[index] = new Field(x,y,w,h,index,coords);
      
    }
    return fields;
  }
  
  void setCoords(int x,int y,int w,int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void show()
  {
    noFill();
    stroke(0);
    strokeWeight(5);
    rect(x,y,w,h);
  }

}
