float theta;
void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
}

void draw() {
  camera(250,100,1000,250,475,-1000,0,1,0);
  background(0);
  pushMatrix();
  fill(255);
  translate(250,250,1000+-theta*100); 
  theta+= .1; 
  rotateX(theta);
  sphere(25);
  popMatrix();
  pushMatrix(); 
  translate(250,500,0);
  box(580,0,1500);
  popMatrix();
  pushMatrix(); 
  translate(250,500,-1000); 
  box(580,0,1000);
  popMatrix();
  pushMatrix(); 
  translate(250,500,-2000); 
  box(580,0,1000);
  popMatrix();
  
 
}