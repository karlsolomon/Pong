public class PongBall extends HardObject{
  int radius;
  PVector velocity;
  public PongBall(int x, int y, int radius, int col) {
    super(x-radius, y-radius, x+radius, y+radius, col);
    float vx = random(0.5,1);
    float vy = random(0,1);
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
  
  public int getPriority() {
    return 2;
  }
  
  
}