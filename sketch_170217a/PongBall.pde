public class PongBall extends HardObject{
  float r;
  PVector velocity;
  PVector position; //top left of ball
  float radius;
  float coeff;
  float coeffX;
  float coeffY;
  color col;
  boolean gameStatus;
  int hue;
  
  private final float limit = .5;

  public PongBall(int x, int y, int radius, color col) {
    super(x-radius, y-radius, x+radius, y+radius, col);
    coeffX = fetchSign();
    coeffY = fetchSign();
    float vx = random(1,2);
    float vy = random(.5,1);
    this.col = col;
    this.radius = radius;
    velocity = new PVector(coeffX*vx,coeffY*vy);
    position = new PVector(x,y);
    gameStatus = true;
    coeffX = 1;
    coeffY = 1;

    
  }
  
  @Override
  public void display() {
    position.x += coeffX*velocity.x; //<>//
    position.y += coeffY*velocity.y;
    super.translate(coeffX*velocity.x, coeffY*velocity.y);
    super.display();
  }  //<>//
  
  public void interact(HardObject o) {
    PVector d;
    d = isTouching(o);
    if (d.x != 1 || d.y != 1) { 
      if(o.getPriority() < this.getPriority()) {
       coeffX *= d.x;
       coeffY *= d.y;
       SoundEffects.ballBounce();
       hue = (int)random(50,300);
       col = color(hue,100,100);
       shape.setFill(col);
      }
      else {
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
    return new PVector(coeffX*velocity.x,coeffY*velocity.y);
  }
  
  public float getRadius() {
    return 2*this.radius;
  }
  public color getColor() {
    return this.col; 
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