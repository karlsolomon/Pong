float theta;
public Ball b;
public Lane lane;
void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
  b = new Ball(25);
  lane = new Lane();
}

void draw() {
  camera(250,100,1000,250,475,-1000,0,1,0);
  background(0);
  b.display();
  lane.display();
 
  
 
}