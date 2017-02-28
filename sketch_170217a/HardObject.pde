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
  
  public PVector isTouching(HardObject o) { //<>//
    PVector p = new PVector(1,1);
    if(myLeftTouching(o) ^ myRightTouching(o)) {
      p.x = -1;
    }
    if(myTopTouching(o) ^ myBottomTouching(o)) {
      p.y = -1;
    }
    if(p.x == -1 && p.y == -1) {
      if(getXOverlap(o) < getYOverlap(o)) {
        p.y = 1;
      }
      else {
        p.x = 1;
      }
    }
    return p;
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
    return leftOverlap(o) && (bottomOverlap(o) || topOverlap(o));
  }
  
  public boolean myRightTouching(HardObject o) {
     return rightOverlap(o) && (bottomOverlap(o) || topOverlap(o));
  }
  
  public boolean myTopTouching(HardObject o) { 
    return topOverlap(o) && (leftOverlap(o) || rightOverlap(o));
}
  
  public boolean myBottomTouching(HardObject o) {
    return bottomOverlap(o) && (leftOverlap(o) || rightOverlap(o));
  }  //<>//
  
  private boolean leftOverlap(HardObject o) {
    return getLeft() >= o.getLeft() && getLeft() <= o.getRight();
  }
  private boolean rightOverlap(HardObject o) {
    return getRight() >= o.getLeft() && getRight() <= o.getRight();
  }
  private boolean topOverlap(HardObject o) {
    return getTop() >= o.getTop() && getTop() <= o.getBottom();
  }
  private boolean bottomOverlap(HardObject o) {
    return getBottom() <= o.getBottom() && getBottom() >= o.getTop();
  }
  
  private float getXOverlap(HardObject o) {
    return max(getLeft() - o.getRight(), getRight() - o.getLeft());
  }
  private float getYOverlap(HardObject o) {
    return max(getBottom() - o.getTop(), getTop() - o.getBottom());
  }
  
  protected PVector center() {
    float x = (this.xRight - this.xLeft)/2 + this.xLeft;
    float y = (this.yBottom - this.yTop)/2 + this.yTop;
    return new PVector(x,y);
  }
  
}

public enum Direction {Right, Left, Up, Down};