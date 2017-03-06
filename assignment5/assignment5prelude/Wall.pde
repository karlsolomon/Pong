class Wall {
 protected PShape wall;
 protected PImage img;
 int x,y,z; 
 int w,l,h;
 int c;

 //      w
 //   |------|  |
 //   |    h | / l  3D-box
 //   |______|/  
 //
 public Wall(int xShift, int yShift, int zShift,int w, int l, int h, String img) {
   this.x = xShift; 
   this.y = yShift; 
   this.z = zShift;
   this.w = w; 
   this.l = l;
   this.h = h;
   this.img = loadImage(img);
   this.c = 255;
   
 }

  public void display() {
    pushMatrix();
    translate(x,y,z);
    wall = createShape(BOX,w,h,l);
    wall.setTexture(img);
    shape(wall);
    popMatrix();
  }
  

}