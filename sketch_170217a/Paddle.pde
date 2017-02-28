public class Paddle extends HardObject{
  int maxY;
  int minY;
  int speed;
  public Paddle(int x1, int y1, int x2, int y2, int col) {
    super(x1, y1, x2, y2, col);
    speed = 5;
  }
  
  public void move(PVector v) {
    super.translate(v.x*speed,v.y*speed);
  }
  
  public void speedUp() {
    this.speed += 1;
  }
  
  public void interact(HardObject o) {  //<>//
    if(o instanceof Edge) { //<>//
      if(this.myTopTouching(o)) {  
        super.translate(0,10);
        paddleShake();
      }
      else if(this.myBottomTouching(o)) {
        super.translate(0,-10);
        paddleShake();
      } //<>//
    } 
  }
  
  public int getPriority() {
    return 1;
  }
  
  private void paddleShake() {
    SoundEffects.paddleShake();
    pushMatrix();
    PVector centerPoint = super.center();
    translate(centerPoint.x, centerPoint.y);
    super.shape.rotate(PI/20);
    super.display();
    translate(-centerPoint.x, -centerPoint.y);
    popMatrix();
  }
}