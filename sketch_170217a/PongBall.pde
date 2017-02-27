public class PongBall extends HardObject{
  int radius;
  PVector velocity;
  PVector position; //top left of ball
  float r;
  float coeff;
  boolean gameStatus;
  
  private final float limit = .5;

  public PongBall(int x, int y, int radius, int col) {
    super(x-radius, y-radius, x+radius, y+radius, col);
    
    float vx = fetchSign() * random(1,2);
    float vy = fetchSign() * random(.5,1);
    velocity = new PVector(vx,vy);
    position = new PVector(x,y);
    gameStatus = true;
  }
  
  public void speedUp() {
    velocity.x += 1;
    velocity.y += random(0,1);
  }
  
  @Override
  public void display() {
    super.translate(velocity.x, velocity.y);
    super.display();
  }
  
  public void interact(HardObject o) {
    Direction d;
    d = isTouching(o);
    if (d!= null) {
      if(o.getPriority() < this.getPriority()) {        //<>//
         if(d.equals(Direction.Left) || d.equals(Direction.Right)) {
           velocity.x *= -1;
         }
         else if(d.equals(Direction.Up) || d.equals(Direction.Down)) {
           velocity.y *= -1;
         }
    }
      else {
       println("It is now touching the soft edge -> GAMEOVER");
       gameStatus = false;
       }
    }
  }

  private float fetchSign() {
   r = random(0,1); 
   if (r < limit) { 
      coeff = -1; 
   }  else { 
        coeff = 1;
   }
   return coeff;
  }
  
  public PVector getPosition() {
    return this.position;
  }
  public PVector getVelocity() {
    return this.velocity;
  }
  
  public int getPriority() {
    return 2;
  }
  public boolean gameStatus() {
    return gameStatus;
  }
  public boolean gameStatus(boolean newStatus) {
   gameStatus = newStatus; 
   return gameStatus;
  }
}