public abstract class Mouse {
  PImage image;
  private int x;
  private int y;
  private int[][][] maze;
  final int xWidth;
  final int yHeight;
  private Direction dir;
  protected ArrayList<Direction> directionOrder; //Direction.LEFT, Direction.UP, Direction.RIGHT, Direction.DOWN};

  public Mouse(int startX, int startY, int movementSize, int[][][] maze, PImage image){
    this.xWidth = movementSize;
    this.yHeight = movementSize;
    this.x = startX;
    this.y = startY;
    this.dir = Direction.UP;
    this.maze = maze;
    this.image = image;
    directionOrder.add(Direction.LEFT);
    directionOrder.add(Direction.UP);
    directionOrder.add(Direction.RIGHT);
    directionOrder.add(Direction.DOWN);
  }
  
  public Point getPosition() {
    return new Point(x,y);
  }
  
  public Direction getDirection() {
    return this.dir;
  }
  
  protected void setDirection(Direction dir) {
    this.dir = dir;
  }
  
  protected boolean moveIsValid() {
    return maze[x][y][directionOrder.indexOf(dir)] == 1;
  }
  
  public void display() {
    image(image, (x+1)*xWidth, (y+1)*yHeight, xWidth, yHeight);
  }
  
  protected void move() {
    switch(dir) {
      case LEFT:
        x -= 1;
      break;

      case UP:
        y -= 1;
      break;

      case RIGHT:
        x += 1;
      break;

      case DOWN:
        y += 1;
      break;
      
      default:
        System.out.println("Error: Invalid Direction");
    }
  }
}

public enum Direction {
    LEFT, UP, RIGHT, DOWN
}