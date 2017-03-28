public class MouseRight extends Mouse {
  public MouseRight (Point start, Point end, int movementSize, int[][][] maze){
    super(start, end, movementSize, maze, loadImage("redMouse.png")); 
  }
  
  void move() {
    int startIndex = directionOrder.indexOf(getDirection()) + 1 + directionOrder.size();
    int endIndex = startIndex - directionOrder.size();
    for(int i = startIndex; i > endIndex; i--) {
      setDirection(directionOrder.get(i % directionOrder.size()));
      if(moveIsValid()) {
        super.move();
        break;
      }
    }    
    super.display();
  } 
  String toString() {
    return "Red Mouse";
  }
}