PongBall b;// = new PongBall();
Edge top;// = new Edge();
Edge bottom;// = new Edge();
Edge left;// = new Edge();
Edge right;// = new Edge();
Paddle player1;// = new Paddle();
Paddle player2;// = new Paddle();
PVector upUnit = new PVector(0,-1);
PVector downUnit = new PVector(0,1);
PVector leftUnit = new PVector(-1,0);
PVector rightUnit = new PVector(1,0);
ArrayList<HardObject> actors;
ArrayList<HardObject> movingActors;
boolean[] keys = new boolean[4]; // {w,s,up,down} //<>// //<>//



void setup() {
  
  
  size(500,500);
  b = new PongBall(width/2, height/2, 5, 255);
  top = new Edge(EdgeType.Hard, 0, 0, width, 9, 255);
  bottom = new Edge(EdgeType.Hard, 0, height-9, width, height,255);
  left = new Edge(EdgeType.Soft, 0, 0, 3, height,12);
  right = new Edge(EdgeType.Soft, width-3, 0, width, height,12);
  player1 = new Paddle(10,10,30,50,255);
  player2 = new Paddle(width-30,10,width-10,50,255);
  actors = new ArrayList<HardObject>();
  movingActors = new ArrayList<HardObject>();
  actors.add(b);
  actors.add(top);
  actors.add(bottom);
  actors.add(left);
  actors.add(right);
  actors.add(player1);
  actors.add(player2);
  movingActors.add(b);
  movingActors.add(player1);
  movingActors.add(player2);
 
}

void draw() {
  moveKeys();
  for(HardObject h : movingActors) {
    for(HardObject o : actors) {
      if(h.equals(o)) continue;
      h.interact(o); //<>//
    }
  }  
  background(0);
  for(HardObject o : movingActors) {
    o.display();
  }
  for(HardObject h : actors) {
    h.display();
  }
}

void moveKeys() {
  if(keys[0]) player1.move(upUnit);
  if(keys[1]) player1.move(downUnit);
  if(keys[2]) player2.move(upUnit);
  if(keys[3]) player2.move(downUnit);

}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      keys[2] = true;
    }
    else if (keyCode == DOWN) {
      keys[3] = true;
    }
  }
  
  else {
    if(key == 'w') {
      keys[0] = true;
    }
    else if (key == 's') {
      keys[1] = true;
    }
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == UP) {
      keys[2] = false;
    }
    else if (keyCode == DOWN) {
      keys[3] = false;
    }
  }
  else {
    if(key == 'w') {
      keys[0] = false;
    }
    else if (key == 's') {
      keys[1] = false;
    }
  }
}