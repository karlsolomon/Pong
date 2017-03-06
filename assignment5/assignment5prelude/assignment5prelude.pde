float theta;
boolean gameDone;
Ball b;
Pins p;
Lane lane;
Wall left; //=new(xShift,yShift,zShift,w,l,h)
Wall ceiling; 
Wall right;
Wall hole; 
int addZ;

void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
  init();
}

void init() {  
  //p = new Pins();
  b = new Ball(25);
  lane = new Lane(250,500,0,500,3000,10);
  left = new Wall(0,500,0,10,3000,1000,"wallTexture.jpg"); 
  ceiling = new Wall(250,0,0,500,3000,10,"wallTexture.jpg");
  right = new Wall(500,500,0,10,3000,1000,"wallTexture.jpg");

  hole = new Wall(250,250,-1500,500,0, 500,"blackScreen.png");  
  addZ = 0;


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
  lights();
  b.display();
  //p.display();
  lane.display();
  left.display();
  ceiling.display();
  right.display();
  hole.display();
}




void keyPressed() {
  if(key == 'r') {
    init();
    redraw();
  }
}