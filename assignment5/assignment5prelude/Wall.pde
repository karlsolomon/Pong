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
  

//=======
//    box(w,h,l);
//    beginShape();
//    texture(walltexture);
//    vertex(-w/2, -h/2, -l/2, 0, 0);
//    vertex(-w/2, -h/2, l/2, 1300, 0);
//    vertex(-w/2, h/2, l/2, 1300, 800);
//    vertex(-w/2, h/2, -l/2, 0, 800);
//    endShape();
//    popMatrix();  
//  }

//  public void LeftwallT(){
  //  pushMatrix();
  //  beginShape();
  //  texture(walltexture);
  //  vertex(-w/2, -h/2, -l/2, 0, 0);
  //  vertex(-w/2, -h/2, l/2, 1300, 0);
  //   vertex(-w/2, h/2, l/2, 1300, 800);
  //  vertex(-w/2, h/2, -l/2, 0, 800);
  //  popMatrix();
    
  //  vertex(w/2, -h/2, -l/2, 0, 0);
  //  vertex(w/2 -h/2, l/2, 1300, 0);
  //  vertex(w/2, h/2, l/2, 1300, 800);
  //  vertex(w/2, h/2, -l/2, 0, 800);
  //  endShape();
    //noStroke();
  //  popMatrix();
//  }
//  public void RightwallT(){
  //  pushMatrix();
  //  beginShape();
  //  texture(walltexture);
  //  vertex(w/2, -h/2, l/2, 0, 0);
  //  vertex(w/2, -h/2, -l/2, 1300, 0);
  //  vertex(w/2, h/2, -l/2, 1300, 800);
  //  vertex(w/2, h/2, l/2, 0, 800);
  //  endShape();
    //noStroke();
  //  popMatrix();
//  }  

//  public void CeilingT(){
//    pushMatrix();
//    beginShape();
//    texture(ceilingtexture);
//    vertex(-w, -h/2, -l/2, 0, 0);
//    vertex(w, -h/2, -l/2, 2000, 0);
//    vertex(w, -h/2, l/2, 2000, 2000);
//    vertex(-w, -h/2, l/2, 0, 2000);
//    endShape();
//    //noStroke();
//    popMatrix();
//  }
  
//>>>>>>> 7d31d5e635c62f03ce8ae9c2971058e316a09965
}