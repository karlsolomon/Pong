class Wall {
 int x,y,z; 
 int w,l,h;
 int c;

 //      w
 //   |------|  |
 //   |    h | / l  3D-box
 //   |______|/  
 //
 public Wall(int xShift, int yShift, int zShift,int w, int l, int h, int col) {
   this.x = xShift; 
   this.y = yShift; 
   this.z = zShift;
   this.w = w; 
   this.l = l;
   this.h = h;
   this.c = col;
   
 }
  public void display() {
    pushMatrix();
    fill(c);
    translate(x,y,z);
    box(w,h,l);
    popMatrix();
  }
}