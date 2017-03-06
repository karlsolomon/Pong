float theta;
Ball b;
Lane lane;
Wall left; //=new(xShift,yShift,zShift,w,l,h)
Wall ceiling; 
Wall right;
Wall hole; 
int addZ=0;

void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
  b = new Ball(25);
  lane = new Lane();
  left = new Wall(0,500,0,0,3000,1000,120); 
  ceiling = new Wall(250,0,0,500,3000,0,120);
  right = new Wall(500,500,0,0,3000,1000,120);
  hole = new Wall(250,250,-1500,500,0, 500,0);  
}

void draw() {
  camera(250,100,1000-addZ,250,475,-700-addZ,0,1,0);
  if ((1000-addZ) >900){
    addZ+=3;
  }
  else if ((1000-addZ) > 800){
    addZ+=5;
  }
  else if ((1000-addZ) > -500){
    addZ+=10;
  }
  background(0);
  
  b.display();
  lane.display();
  left.display();
  ceiling.display();
  right.display();
  hole.display(); 
}