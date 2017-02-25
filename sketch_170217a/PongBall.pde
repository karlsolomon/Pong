public class PongBall extends HardObject{
  int radius;
  PVector velocity;
  float r;
  float coeff;
  
  private final float limit = .5;

  public PongBall(int x, int y, int radius, int col) {
    super(x-radius, y-radius, x+radius, y+radius, col);
    
    float vx = fetchSign() * random(1,2);
    float vy = fetchSign() * random(.5,1);
    velocity = new PVector(vx,vy);

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
    if(o.getPriority() < this.getPriority()) {
       d = isTouching(o); //<>//
       if(d != null) {
         if(d.equals(Direction.Left) || d.equals(Direction.Right)) {
           velocity.x *= -1;
         }
         else if(d.equals(Direction.Up) || d.equals(Direction.Down)) {
           velocity.y *= -1;
         }
       }
    }
    else {
      
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
  
  public int getPriority() {
    return 2;
  }
  public boolean gameStatus() {
    return true;
  }
  
}