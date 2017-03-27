public class MouseLeft extends Mouse {
  
  public MouseLeft (Point start, Point end, int movementSize, int[][][] maze){
    super(start, end, movementSize, maze, loadImage("greenMouse.png"));
  }
  
  void move() {
    int startIndex = directionOrder.indexOf(getDirection()) + 1 + directionOrder.size();
    int endIndex = startIndex - directionOrder.size();
    for(int i = startIndex; i > endIndex; i--) {
      if(!moveIsValid()) {
        setDirection(directionOrder.get(i % directionOrder.size()));
      } else {
        super.move();
      }
    }
    super.display();
  }
}