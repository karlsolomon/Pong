public class MouseRight extends Mouse {
  public MouseRight (int startX, int startY, int movementSize, int[][][] maze){
    super(startX, startY, movementSize, maze, loadImage("redMouse.png"));
  }
  void move() {
    int startIndex = (directionOrder.indexOf(getDirection()) + 1) % directionOrder.size();
    int endIndex = startIndex + directionOrder.size();
    for(int i = startIndex; i < endIndex; i ++) {
      if(!moveIsValid()) {
        setDirection(directionOrder.get(i % directionOrder.size()));
      } else {
        super.move();
      }
    }
  }
}