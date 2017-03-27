public abstract class Mouse {
  private int x;
  private int y;
  private int[][][] maze;
  final int xWidth;
  final int yHeight;
  private Direction dir;
  protected ArrayList<Direction> directionOrder; //Direction.LEFT, Direction.UP, Direction.RIGHT, Direction.DOWN};

  public Mouse(int startX, int startY, int movementSize, int[][][] maze){
    this.xWidth = movementSize;
    this.yHeight = movementSize;
    this.x = startX;
    this.y = startY;
    this.dir = Direction.UP;
    this.maze = maze;
    directionOrder.add(Direction.LEFT);
    directionOrder.add(Direction.UP);
    directionOrder.add(Direction.RIGHT);
    directionOrder.add(Direction.DOWN);
  }
  
  public Direction getDirection() {
    return this.dir;
  }
  
  void updateDirection() {
    this.dir = calculateChangeInDirection();
  }

  abstract Direction calculateChangeInDirection();

  protected boolean moveIsValid() {
    return maze[x][y][directionOrder.indexOf(dir)] == 1;
  }

  void move() {
    switch(dir) {
      case LEFT:
        x -= 1;
        //push/pop matrix
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