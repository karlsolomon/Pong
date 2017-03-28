public abstract class Mouse {
  PImage image;
  Point end;
  Point current;
  int numberOfMoves;
  private int[][][] maze;
  final int xWidth;
  final int yHeight;
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
    image(image, (current.getXPos()+1)*xWidth, (current.getYPos()+1)*yHeight, xWidth, yHeight);
  }
  
  protected void move() {
    switch(dir) {
      case LEFT:
        current.setXPos(current.getXPos() - 1);
      break;
      
      case UP:
        current.setYPos(current.getYPos() - 1);
      break;

      case RIGHT:
        current.setXPos(current.getXPos() + 1);
      break;

      case DOWN:
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