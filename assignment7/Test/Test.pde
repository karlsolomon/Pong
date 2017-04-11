MillenniumFalcon user;
TaiFighter enemy;
boolean[] inputs;
boolean pause = false;
boolean run = false;
Wave wave;
GUI gui;
int lives;

PFont font;
PImage ship;
PImage ene;

void setup() {
  user = new MillenniumFalcon(250,height-Statics.bottomBuffer-40,10);
  size(500,500); 
  background(0); 
  inputs = new boolean[3]; 
  wave = new Wave();
  gui = new GUI();

  ene = loadImage("enemy.png");
  ship = loadImage("ship.png");
  font = createFont("ARCADECLASSIC",90);
  for (int input = 0; input < 3; input++) {
    inputs[input] = false;
  }
}



void draw() {
  startScreen();
  if (pause == true && run == false){
    pauseScreen();
  }
  else if (run == true){
    user.display();
  
    if (inputs[0]) user.shoot(); 
    if (inputs[1] && user.withinLeft()) user.move(Direction.LEFT);
    else if (inputs[2] && user.withinRight()) user.move(Direction.RIGHT);
    for (Bullet b: Statics.bullets) {
      for(Ship i : Statics.enemies) {
        i.bulletTouching(b);
      }
      user.bulletTouching(b);
      b.show();
    }
    for(Bullet b: Statics.bullets) {
      if(b.getY() > height-Statics.bottomBuffer || b.getY() < Statics.topBuffer) {
        Statics.inactiveBullets.add(b);
      }
    }
    Statics.bullets.removeAll(Statics.inactiveBullets);
    Statics.inactiveBullets = new ArrayList<Bullet>();
    if(!wave.isDone()) {
      wave.doStep();
    }
    else {
      wave = new Wave();
    }
    if(!user.isAlive()) {
      noLoop();
      print("GAME OVER");
    }
  }
}

void startScreen (){
  background(0);
  ene.resize(150,150);
  ship.resize(200,200);
  image(ship,150,220);
  image(ene,40,170);
  image(ene,310,170);
  textFont(font);
  textAlign(CENTER);
  fill(255);
  text("Space\n",250,90);
  fill(#1CD332);
  text("Invaders",250,140);  
  textSize(30);
  text("Press  enter  to  Start",250,430);
  fill(255);
  textSize(23);
  text("a  left    d  right    SPACE  shoots   r  ultimate",250,460);
  text("Press  p  at  any  time  to  pause",250,480);
}

void pauseScreen (){
  background(0);
  ene.resize(150,150);
  ship.resize(200,200);
  image(ship,150,190);
  image(ene,40,140);
  image(ene,310,140);
  textFont(font);
  textAlign(CENTER);
  fill(255);
  textSize(60);
  text("PAUSED",250,110);
  fill(#1CD332);
  textSize(25);
  text("Press  P  to  Resume",250,450);
}

void keyPressed() {
  if (key == ENTER){
      run = true;
  }
  
  if (key == 'p'){
    if (pause == false){
      pause = true;
      run = false;
      //noLoop();
    }
    else{
      pause = false;
      run = true;
      //loop();
    }
  }
  if (key == ' ') {
    inputs[0] = true;
  }
 
  if (key == 'a') {
    inputs[1]  = true;
  } else if (key == 'd') {
      inputs[2] = true;;
  }
}
void keyReleased() {
  if (key == ' ') {
    inputs[0] = false;
  }
   if (key == 'r') {
    user.toggleUlt();
  }
  if (key == 'a') {
    inputs[1]  = false;
  } else if (key == 'd') {
      inputs[2] = false;
  }
}