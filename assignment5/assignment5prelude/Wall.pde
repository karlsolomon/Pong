class Wall {
 int x,y; 
 int w,l,h;
 int zTranslation;
 //      w
 //   |------|  |
 //   |    h | / l  3D-box
 //   |______|/  
 //
 public Wall(int xPos, int yPos, int w, int l, int h) {
   this.x = xPos; 
   this.y = yPos; 
   this.w = w; 
   this.l = l;
   this.h = h;
   zTranslation = 0;
 }
  public void display() {
    pushMatrix();
    fill(255);
    translate(x,y,zTranslation);
    box(w,h,l);
    popMatrix();
  }
}