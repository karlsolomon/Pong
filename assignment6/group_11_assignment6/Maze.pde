class Maze {
  /* 
  For maze creation: 
    1) Needs to assign start, end position 
    2) Draw lines from start to end on both side, creating two different lines
    3) 
  */
  int gap; 
  int width_openings;
  int startX,startY;
  int endX,endY;
  ArrayList<Point> pointsAll;
  ArrayList<Point> pointsR; 
  ArrayList<Point> pointsL;
  ArrayList<Line> lines; 

  public Maze(int cellSize) {
    gap = cellSize; 
    this.width_openings = cellSize*2;
    startX = (int) random(cellSize,width-width_openings-cellSize);
    startX = startX - startX % cellSize;
    startY = height-cellSize;
    endX = (int) random(cellSize,width-width_openings-cellSize);
    endX = endX - endX % cellSize;
    endY = cellSize;
    pointsAll = new ArrayList<Point>();
  }

  public void initializeFrame() {
    final int xInit = startX + width_openings; 
    final int yInit = startY; 
    final int xEnd = endX + width_openings; 
    final int yEnd = endY;
    pointsR = new ArrayList<Point>();
    pointsL = new ArrayList<Point>();
    helperInit(pointsR,gap,xInit,yInit, xEnd, yEnd);
    helperInit(pointsL,-gap,xInit-width_openings,yInit, xEnd-width_openings, yEnd);
    
  }

  public void helperInit(ArrayList<Point> points,int step, int startX, int startY, int endX, int endY) {
    int xCounter = startX; 
    int yCounter = startY;
    int xStep = 1; //initially only x-movement
    int yStep = 0; 
    int endOfScreen;
    if (step < 0)  
      endOfScreen = gap; 
    else 
      endOfScreen = width-gap;
    
    while (xCounter != endX-step || yCounter != endY) {

      if (xCounter == endOfScreen) {
        xStep = 0; 
        yStep = 1;
      }
      if (yCounter == gap) {
        xStep = -1; 
        yStep = 0;
      }
      points.add(new Point(xCounter,yCounter));
      pointsAll.add(new Point(xCounter,yCounter));
      xCounter += xStep * step; 
      yCounter -= yStep * abs(step);
    }

  }

  public void createMaze() {
      while(!mazeFull) {
        makeNewLine();
      }
  }

  public void makeNewLine() {
    //get a random point
    // check for random direction (up, down, left,right)
    // if valid direction (isValidPoint)
    // make new point
    // make new line
  }

  public boolean isValidPoint(Point point, int newX, int newY) {
    for (Point p: pointsAll) {
      if(newX == p.getXPos() && newY == p.getYPos()) 
        return false;
    }


    return true; 
  }
  public void display() {
    for (Line line: lines) 
      line.display();
  }

  public void updateLines() {
  lines = new ArrayList<Line>();
    for (int elt = 0; elt < pointsR.size()-1; elt++)
      lines.add(new Line(pointsR.get(elt),pointsR.get(elt+1)));
    for (int elt = 0; elt < pointsL.size()-1;elt++)
      lines.add(new Line(pointsL.get(elt),pointsL.get(elt+1)));
  }
  public int getCellSize() { 
    return gap;
  }

class Point {

  int x; 
  int y; 
  public Point(int xPos, int yPos) { 
    x = xPos; 
    y = yPos;  
  }
  public int getXPos() {
    return x; 
  }
  public int getYPos() {
    return y; 
  }
}

class Line { 
  Point s; 
  Point e;
  public Line(Point start, Point end) { 
    s = start; 
    e = end; 
  }
  public void display() { 

    line(s.getXPos(),s.getYPos(),e.getXPos(),e.getYPos());
  }
  boolean isVertical() {

    return s.getXPos() == e.getXPos();
  }

  void convertLineToGridBarrier() {
    int x1;
    int x2;
    int y1;
    int y2;
    if(!isVertical()) {
      y1 = s.getYPos()/gap - 2;
      y2 = y1 + 1;
      x1 = s.getXPos() < e.getXPos() ? s.getXPos() : e.getXPos();
      x1 = (x1 / gap) - 1;
      x2 = x1;
      try {        
        foo[x1][y1][3] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      try {        
        foo[x2][y2][1] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      
    }
    else {
      y1 = s.getYPos() < e.getYPos() ? s.getYPos() : e.getYPos(); 
      y1 = (y1/gap) - 1; 
      y2 = y1;  
      x1 = s.getXPos()/gap - 2; 
      x2 = x1 + 1;
       try {        
        foo[x1][y1][2] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      try {        
        foo[x2][y2][0] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
    }
  }

}

}