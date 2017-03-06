float theta;
boolean gameDone;
Ball b;
Pins p;
Lane lane;
Wall left; //=new(xShift,yShift,zShift,w,l,h)
Wall ceiling; 
Wall right;
Wall hole; 
int addZ=0;
PImage walltexture;
PImage ceilingtexture;
PImage floortexture;


void setup() {
  fill(255); 
  background(0);
  size(500,500,P3D); 
  theta = 0;
  init();
  walltexture = loadImage("wall.jpg");
  ceilingtexture = loadImage("ceiling.jpg");
  floortexture = loadImage("floor.jpg");
}

void init() {  
  p = new Pins(-1100);
  b = new Ball(25);
  lane = new Lane();
  left = new Wall(0,500,0,0,3000,1000,120); 
  ceiling = new Wall(250,0,0,500,3000,0,120);
  right = new Wall(500,500,0,0,3000,1000,120);
  hole = new Wall(250,250,-1500,500,0, 500,0);  

}

void draw() {
  camera(250,100,1100-addZ,250,475,-200-addZ,0,1,0);
  if ((1000-addZ) >900){
    addZ+=4;
  }
  else if ((1000-addZ) > 800){
    addZ+=6;
    p.scatter();
  }
  else if ((1000-addZ) > -700){
    addZ+=10;
   
  }
  //camera(250,100,1000-addZ,250,475,-700-addZ,0,1,0);
  //if ((1000-addZ) > 990){
    //addZ+=2;
  //}
  //else if ((1000-addZ) > 900){
    //addZ+=4;
  //}
  //else if ((1000-addZ) > 750){
    //addZ+=7;
  //}
  //else if ((1000-addZ) > -200){
    //addZ+=10;
  //}
  //else if ((1000-addZ) > -600){
    //addZ+=12;
  //}
  background(0);
  lights();
  pointLight(255,255,255,width,height,1000);
  
  b.display();
  p.display();
  lane.display();
  lane.FloorT();
  left.display();
 // left.LeftwallT();
  ceiling.display();
  ceiling.CeilingT();
  right.display();
 // right.RightwallT();
  hole.display();
  
}




void keyPressed() {
  if(key == 'r') {
    init();
    redraw();
  }
}