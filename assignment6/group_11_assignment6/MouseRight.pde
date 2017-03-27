public class MouseRight extends Mouse {
  
  List<Direction> directionOrder = Arrays.asList(new Direction[] {Direction.RIGHT, Direction.UP, Direction.LEFT, Direction.DOWN});
  public MouseRight (Point start, Point end, int movementSize, int[][][] maze){
    super(start, end, movementSize, maze, loadImage("redMouse.png")); 
  }
  
  void move() {
    int startIndex = directionOrder.indexOf(getDirection()) + 1 + directionOrder.size();
    int endIndex = startIndex - directionOrder.size();   
    print("\nRight ==> My dir: " + getDirection());
    for(int i = startIndex; i > endIndex; i--) {
      setDirection(directionOrder.get(i % directionOrder.size()));
      if(moveIsValid()) {
        print("\nMoving: " + getDirection());
        super.move();
        break;
      }
    }
    
    super.display();
  }  
}