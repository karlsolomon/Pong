float theta;
boolean gameDone;
boolean pinsSet;
boolean ballRolling;
Ball b;
Pins p;
Lane lane;
Wall left; 
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
  SoundEffects.initialize(this);
}

void init() {
  ballRolling = true;
  p = new Pins(-1100);
  b = new Ball();
  lane = new Lane(250,500,0,500,3000,10);
  left = new Wall(0,500,0,10,3000,1000,"wallTexture.jpg"); 
  ceiling = new Wall(250,0,0,500,3000,10,"ceiling.jpg");
  right = new Wall(500,500,0,10,3000,1000,"wallTexture.jpg");
  hole = new Wall(250,250,-1500,500,0, 500,"blackScreen.png");  
  addZ = 0;
}


void draw() {
  background(0);
  display();
  if (ballRolling) { 
    SoundEffects.ballRolling(ballRolling);
    ballRolling = false;
  }
  lights();
  pointLight(255,255,255,width,height,1000);  
  camera(250,100,1100-addZ,250,475,-200-addZ,0,1,0);
  if(!pinsSet) {
    pinsSet = p.dropPins(0);
  }
  else if(b.getPosition() > p.getPosition()){

    b.display();
    
    
    if ((1000-addZ) >900){
      addZ+=6;
    }
    else if ((1000-addZ) > 800){
      addZ+=9;
    }
    else if ((1000-addZ) > -700){
      addZ+=15;
    }
    p.display();
  }
  else if(!gameDone) {
    b.display();
    gameDone = p.scatter(-1600);
  }
  else {
    gameDone = false;
    pinsSet = false;
    init();
  }
}

void display() { 
    p.display();
    lane.display();
    left.display();
    ceiling.display();
    right.display();
    hole.display();
}