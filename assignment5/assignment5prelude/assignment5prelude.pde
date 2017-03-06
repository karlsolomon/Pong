float theta;
Ball b;
Lane lane;
Wall left;
Wall ceiling; 
Wall right;

void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
  b = new Ball(25);
  lane = new Lane();
  left = new Wall(0,500,0,1500,500); 
  ceiling = new Wall(250,0,500,1500,0);
  right = new Wall(500,500,0,1500,500);
}

void draw() {
  camera(250,100,1000,250,475,-1000,0,1,0);
  background(0);
  b.display();
  lane.display();
  left.display();
  ceiling.display();
  right.display();
 
  
 
}