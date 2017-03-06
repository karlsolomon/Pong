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
    beginShape();
    texture(walltexture);
    vertex(-w/2, -h/2, -l/2, 0, 0);
    vertex(-w/2, -h/2, l/2, 1300, 0);
    vertex(-w/2, h/2, l/2, 1300, 800);
    vertex(-w/2, h/2, -l/2, 0, 800);
    endShape();
    popMatrix();  
  }

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

  public void CeilingT(){
    pushMatrix();
    beginShape();
    texture(ceilingtexture);
    vertex(-w, -h/2, -l/2, 0, 0);
    vertex(w, -h/2, -l/2, 2000, 0);
    vertex(w, -h/2, l/2, 2000, 2000);
    vertex(-w, -h/2, l/2, 0, 2000);
    endShape();
    //noStroke();
    popMatrix();
  }
  
}