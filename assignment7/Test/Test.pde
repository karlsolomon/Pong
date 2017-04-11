MillenniumFalcon user;
TaiFighter enemy;
boolean[] inputs;
Wave wave;

void setup() {
  user = new MillenniumFalcon(250,450,10);
  size(500,500); 
  background(0); 
  inputs = new boolean[3]; 
  wave = new Wave();
  for (int input = 0; input < 3; input++) {
    inputs[input] = false;
  }
}



void draw() {
  background(0); 
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

void keyPressed() {
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