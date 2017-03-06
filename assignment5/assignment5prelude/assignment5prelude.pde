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
  SoundEffects.initialize(this);
}

void init() {  

  p = new Pins(-1100);
  b = new Ball(25);
  lane = new Lane(250,500,0,500,3000,10);
  left = new Wall(0,500,0,10,3000,1000,"wallTexture.jpg"); 
  ceiling = new Wall(250,0,0,500,3000,10,"ceiling.jpg");
  right = new Wall(500,500,0,10,3000,1000,"wallTexture.jpg");
  hole = new Wall(250,250,-1500,500,0, 500,"blackScreen.png");  
  addZ = 0;
}

void draw() {
  if(b.getPosition() > p.getPosition()){
    camera(250,100,1100-addZ,250,475,-200-addZ,0,1,0);
    if ((1000-addZ) >900){
      addZ+=4;
    }
    else if ((1000-addZ) > 800){
      addZ+=6;
    }
    else if ((1000-addZ) > -700){
      addZ+=10;
    }
    background(0);
    lights();
    pointLight(255,255,255,width,height,1000);
    
    b.display();
    p.display();
    lane.display();
    //lane.FloorT();
    left.display();
    ceiling.display();
    //ceiling.CeilingT();
    right.display();
    hole.display();
  }
  else {
    background(0);
    lights();
    pointLight(255,255,255,width,height,1000);
    b.display();
    p.scatter(-1500);
    lane.display();
    //lane.FloorT();
    left.display();
    ceiling.display();
    //ceiling.CeilingT();
    right.display();
    hole.display();
  }

}




void keyPressed() {
  if(key == 'r') {
    init();
    redraw();
  }
}