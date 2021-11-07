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
  int[][] fields;
  int x,y,w,h;


  Gamefield(int dim)
  {
    this.dim = dim;
    this.fields = create_n_dimensional_array(dim);
  }

  int[][] create_n_dimensional_array(int dim)
  {
    fields = new int[power(3,dim)][dim];
   
    for(int i=0;i<fields.length;i++)
    {
      for(int j=0;j<fields[i].length;j++)
      {
        fields[i][j] = ndivide(i,3,j) % 3;
      } 
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
