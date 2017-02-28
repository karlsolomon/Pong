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
  
  public void interact(HardObject o) { //<>//
    if(o instanceof Edge) { //<>//
      if(this.myTopTouching(o)) {
        println("Top Touch: " + o);
        super.translate(0,10);
        SoundEffects.paddleShake();
      }
      else if(this.myBottomTouching(o)) {
        println("Bottom Touch: " + o);
        super.translate(0,-10);
        SoundEffects.paddleShake();
      }
      else if(this.myLeftTouching(o)) {
        println("Left Touch: " + o);
        super.translate(10,0);
      }
      else if(this.myRightTouching(o)) {
        println("Right Touch: " + o);
        super.translate(-10,0);
      } //<>//
    }
  }
  
  public int getPriority() {
    return 1;
  }
}