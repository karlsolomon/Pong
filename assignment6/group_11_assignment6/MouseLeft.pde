public class MouseLeft extends Mouse {
  ArrayList<Direction> directionOrder;
  public MouseLeft (Point start, Point end, int movementSize, int[][][] maze){
    super(start, end, movementSize, maze, loadImage("greenMouse.png"));
    directionOrder = new ArrayList<Direction>();
    directionOrder.add(Direction.LEFT);
    directionOrder.add(Direction.UP);
    directionOrder.add(Direction.RIGHT);
    directionOrder.add(Direction.DOWN);
  }
  
  void move() {
    int startIndex = directionOrder.indexOf(getDirection()) + (directionOrder.size() - 1);
    int endIndex = startIndex + directionOrder.size();   
    print("\nLeft ==> My dir: " + getDirection());
    for(int i = startIndex; i < endIndex; i++) {
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