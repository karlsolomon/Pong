public abstract class Mouse {
  PImage image;
  Point end;
  Point current;
  int numberOfMoves;
  private int[][][] maze;
  final int xWidth;
  final int yHeight;
  float rad;
  private Direction dir;
  public ArrayList<Direction> directionOrder;
  
  public Mouse(Point start, Point end, int movementSize, int[][][] maze, PImage image){
    this.numberOfMoves = 0;
    this.xWidth = movementSize;
    this.yHeight = movementSize;
    this.current = start;
    this.end = end;
    this.dir = Direction.UP;
    this.maze = maze;
    this.image = image;
    directionOrder = new ArrayList<Direction>();
    directionOrder.add(Direction.LEFT);
    directionOrder.add(Direction.UP);
    directionOrder.add(Direction.RIGHT);
    directionOrder.add(Direction.DOWN);    
  }
  
  public Point getPosition() {
    return current;
  }
  
  public boolean finishedMaze() {
    return end.equals(current);
  }
  
  public Direction getDirection() {
    return this.dir;
  }
  
  abstract String toString();
  
  protected void setDirection(Direction dir) {
    this.dir = dir;
  }
  
  protected boolean moveIsValid() {
    boolean isValid;
    try {
      isValid = maze[current.getYPos()][current.getXPos()][directionOrder.indexOf(dir)] == 1;
    } catch (ArrayIndexOutOfBoundsException e) {
      isValid = false;
    }
    return isValid;
  }
  
  public void display() {
    updateMouse(rad);    
  }
  
  public void updateMouse(float rad) {
    pushMatrix();
    translate(((current.getXPos()+1)*xWidth+xWidth/2), ((current.getYPos()+1)*yHeight+yHeight/2));
    rotate(rad);
    image(image, -xWidth/2, -yHeight/2, xWidth, yHeight);
    popMatrix();
  }
  
  protected void move() {
    switch(dir) {
      case LEFT:
        rad=PI/2;
        current.setXPos(current.getXPos() - 1);
      break;
      
      case UP:
        rad=PI;
        current.setYPos(current.getYPos() - 1);
      break;

      case RIGHT:
        rad=-PI/2;
        current.setXPos(current.getXPos() + 1);
      break;

      case DOWN:
        rad=2*PI;
        current.setYPos(current.getYPos() + 1);
      break;
      
      default:
        System.out.println("Error: Invalid Direction");
    }
    numberOfMoves++;
  }
  
  public int getNumberOfMoves() {
    return numberOfMoves;
  }
}