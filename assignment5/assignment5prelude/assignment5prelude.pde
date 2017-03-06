float theta;
Ball b;
Pin p;
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
  init();
}

void init() {  
  p = new Pin();
  b = new Ball(25);
  lane = new Lane();
  left = new Wall(0,500,0,0,3000,1000,120); 
  ceiling = new Wall(250,0,0,500,3000,0,120);
  right = new Wall(500,500,0,0,3000,1000,120);
<<<<<<< HEAD
  hole = new Wall(250,250,-1500,500,0, 500,0);
=======
  hole = new Wall(250,250,-1500,500,0, 500,0);  
>>>>>>> 545b9932dcb10c4bb4bbc8b7bba0df49394dbca8
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
  p.display();
  lane.display();
  left.display();
  ceiling.display();
  right.display();
<<<<<<< HEAD
  hole.display();
}

void keyPressed() {
  if(key == 'r') {
    init();
    redraw();
  }
=======
  hole.display(); 
>>>>>>> 545b9932dcb10c4bb4bbc8b7bba0df49394dbca8
}