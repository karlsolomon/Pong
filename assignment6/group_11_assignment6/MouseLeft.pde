public class MouseLeft extends Mouse {
  public MouseLeft (int startX, int startY, int movementSize, int[][][] maze){
    super(startX, startY, movementSize, maze);
  }
  
  Direction calculateChangeInDirection() {
    return Direction.LEFT;
  }
}