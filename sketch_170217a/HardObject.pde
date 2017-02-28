public abstract class HardObject{
  protected PShape shape;
  float xLeft;
  float xRight;
  float yTop;
  float yBottom;
  /* Corner Orientation
      0    1
      
      3    2
  */
  public HardObject(float xLeft, float yTop, float xRight, float yBottom, int col) {
    shape = createShape();
    shape.setFill(col);
    shape.beginShape();  //<>//
    shape.vertex(xLeft, yTop);
    shape.vertex(xRight, yTop);
    shape.vertex(xRight, yBottom);
    shape.vertex(xLeft, yBottom);
    shape.endShape();
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yTop = yTop;
    this.yBottom = yBottom;
  }
  
  public float getLeft() {
    return this.xLeft;
  }
  public float getRight() {
    return this.xRight;
  }
  public float getTop() {
    return this.yTop;
  }
  public float getBottom() {
    return this.yBottom;
  }
  
  public void translate(float x, float y) {
    shape.translate(x,y);
    updateVertices(x, y);
  }
  
  public Direction isTouching(HardObject o) {  //<>//
    boolean left = myLeftTouching(o);
    boolean right = myRightTouching(o);
    boolean top = myTopTouching(o);
    boolean bottom = myBottomTouching(o);
    boolean moveLeft = left && !right;
    boolean moveRight = right && !left;
    boolean moveUp = bottom && !top;
    boolean moveDown = top && !bottom;
    
    if(moveLeft)return Direction.Left;
    else if(moveRight) return Direction.Right;
    else if(moveDown) return Direction.Down;
    else if(moveUp) return Direction.Up;
    else return null;
  }
  
  public abstract void interact(HardObject o);
  public abstract int getPriority();
  
  public void display() {
    shape(shape);
  }
  
  public void updateVertices(float xShift, float yShift) {
    xLeft += xShift;
    xRight += xShift;
    yTop += yShift;
    yBottom += yShift;
  }
  
  public boolean myLeftTouching(HardObject o) {
    boolean isTouching = (getLeft() <= o.getRight() && getRight() >= o.getRight()) && (getTop() >= o.getTop() && getBottom() <= o.getBottom()) ;

    return isTouching;
  }
  
  public boolean myRightTouching(HardObject o) {
     boolean isTouching = (getRight() >= o.getLeft() && getLeft() <= o.getLeft()) && (getTop() >= o.getTop() && getBottom() <= o.getBottom()) ;
     return isTouching;
  }
  
  public boolean myTopTouching(HardObject o) { 
    boolean isTouching = (getTop() >= o.getTop() && getTop() <= o.getBottom()) && (getLeft() >= o.getLeft() && getRight() <= o.getRight());
    return isTouching;
}
  
  public boolean myBottomTouching(HardObject o) {
    return (getBottom() <= o.getBottom() && getBottom() >= o.getTop()) && (getLeft() >= o.getLeft() && getRight() <= o.getRight());
  }  //<>//
}

public enum Direction {Right, Left, Up, Down};