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
 public Wall(int xShift, int yShift, int zShift,int w, int l, int h, int col) {
   this.x = xShift; 
   this.y = yShift; 
   this.z = zShift;
   this.w = w; 
   this.l = l;
   this.h = h;
   this.c = col;
   img = loadImage("wallTexture.jpg");
   
 }
  public void display() {
    pushMatrix();
    fill(c);
    translate(x,y,z);
    //createWall();
    wall = createShape(BOX,w,h,l);
    wall.setTexture(img);
    shape(wall);
    popMatrix();
  }
  
  //private void createWall() { 
  //  beginShape(QUADS); 
  //  //texture(img);
    
  //  //"Front" Face 
  //  vertex(x,y,z); 
  //  vertex(x+w,y,z); 
  //  vertex(x+w,y-h,z); 
  //  vertex(x,y+h,z);
    
  //  //"Back" Face
  //  vertex(x,y,z-l); 
  //  vertex(x+w,y,z-l); 
  //  vertex(x+w,y-h,z-l); 
  //  vertex(x,y-h,z-l);
    
  //  //"Left" Face
  //  vertex(x,y,z); 
  //  vertex(x,y,z-l); 
  //  vertex(x,y-h,z-l); 
  //  vertex(x,y-h,z);
    
  //  //"Right" Face
  //  vertex(x+w,y,z); 
  //  vertex(x+w,y,z-l); 
  //  vertex(x+w,y-h,z-l); 
  //  vertex(x+w,y-h,z);
    
  //  //Top Face
  //  vertex(x,y,z); 
  //  vertex(x,y,z-l); 
  //  vertex(x+h,y,z-l); 
  //  vertex(x+h,y,z);
    
  //  //Bottom Face
  //  vertex(x,y,z); 
  //  vertex(x,y,z+l); 
  //  vertex(x+h,y,z+l); 
  //  vertex(x+h,y,z);
    
  //  endShape();
  //}
}