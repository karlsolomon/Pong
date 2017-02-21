public abstract class HardObject{
  protected PShape shape;
  
  /* Corner Orientation
      0    1
      
      3    2
  */
  public HardObject(int xLeft, int yTop, int xRight, int yBottom, int col) {
    shape = createShape();
    shape.setFill(col);
    shape.beginShape(); //<>//
    shape.vertex(xLeft, yTop);
    shape.vertex(xRight, yTop);
    shape.vertex(xRight, yBottom);
    shape.vertex(xLeft, yBottom);
    shape.endShape();   
   
  }
  
  public Direction isTouching(HardObject o) { //<>//
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
  
  public boolean myLeftTouching(HardObject o) {
    return shape.getVertex(0).x <= o.shape.getVertex(1).x && shape.getVertex(1).x >= o.shape.getVertex(1).x;
  }
  
  public boolean myRightTouching(HardObject o) {
     return shape.getVertex(1).x >= o.shape.getVertex(0).x && shape.getVertex(0).x <= o.shape.getVertex(0).x;
  }
  
  public boolean myTopTouching(HardObject o) { //<>//
    return (shape.getVertex(0).y >= o.shape.getVertex(0).y && shape.getVertex(0).y <= o.shape.getVertex(2).y) && (shape.getVertex(0).x >= o.shape.getVertex(0).x && shape.getVertex(1).x <= o.shape.getVertex(1).x);
  }
  
  public boolean myBottomTouching(HardObject o) {
    return (shape.getVertex(2).y <= o.shape.getVertex(2).y && shape.getVertex(2).y >= o.shape.getVertex(0).y) && (shape.getVertex(0).x >= o.shape.getVertex(0).x && shape.getVertex(1).x <= o.shape.getVertex(1).x);
  }
}

public enum Direction {Right, Left, Up, Down};