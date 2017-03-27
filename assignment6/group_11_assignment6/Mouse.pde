public abstract class Mouse {
  PImage image;
  Point end;
  Point current;
  private int[][][] maze;
  final int xWidth;
  final int yHeight;
  private Direction dir;
  protected ArrayList<Direction> directionOrder; //Direction.LEFT, Direction.UP, Direction.RIGHT, Direction.DOWN

  public Mouse(Point start, Point end, int movementSize, int[][][] maze, PImage image){
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
  
  protected void setDirection(Direction dir) {
    this.dir = dir;
  }
  
  protected boolean moveIsValid() {
    boolean isValid = maze[current.getXPos()][current.getYPos()][directionOrder.indexOf(dir)] == 1;
    print(isValid);
    return isValid;
  }
  
  public void display() {
    image(image, (current.getXPos()+1)*xWidth, (current.getYPos()+1)*yHeight, xWidth, yHeight);
    //pushMatrix();
    //image(image, 0, 0, xWidth, yHeight);
    //rotate(PI/2 * (directionOrder.indexOf(dir) - 1));
    //print(dir);
    //translate((current.getXPos()+1)*xWidth, (current.getYPos()+1)*yHeight);
    //popMatrix();
    print("X: " + current.getXPos() + " Y: " + current.getYPos() + "\n");
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
  }
}