public class Paddle extends HardObject{
  int maxY;
  int minY;
  int speed;
  public Paddle(int x1, int y1, int x2, int y2, int col) {
    super(x1, y1, x2, y2, col);
    speed = 5;
  }
  
  public void move(PVector v) {
    super.shape.translate(v.x*speed,v.y*speed);
  }
  
  public void speedUp() {
    this.speed += 1;
  }
  
  public void interact(HardObject o) {
    //Direction d;
    //float xShift = 0;
    //float yShift = 0; //<>//
    if(o instanceof Edge) { //<>// //<>//
      if(this.myTopTouching(o)) {
        println("Top Touch: " + o);
        super.shape.translate(0,1);
      }
      else if(this.myBottomTouching(o)) {
        println("Bottom Touch: " + o);
        super.shape.translate(0,-1);
      }
      
    
      //d = isTouching(o);
      //if(d != null) {
      //  if(d.equals(Direction.Right)) { //<>//
      //    xShift = super.shape.getVertex(1).x - ((Edge) o).getLeft();
      //  }
      //  else if(d.equals(Direction.Left)) {
      //    xShift = ((Edge) o).getRight() - super.shape.getVertex(0).x;
      //  }
      //  else if(d.equals(Direction.Up)) {
      //    yShift = super.shape.getVertex(0).y - ((Edge) o).getBottom();
      //  }
      //  else if(d.equals(Direction.Down)) {
      //    yShift = ((Edge) o).getTop() - super.shape.getVertex(1).x;
      //  }
      //  super.shape.translate(xShift,yShift);
      //}
    }
   
  }
  
  public int getPriority() {
    return 1;
  }
}