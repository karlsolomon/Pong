 //<>//
public class Maze {  
  int gap; 
  int width_openings;
  int startX,startY;
  int endX,endY;
  ArrayList<Point> pointsAll;
  ArrayList<Point> pointsR; 
  ArrayList<Point> pointsL;
  ArrayList<Line> lines; 
  ArrayList<Point> badPoints;
  int[][][] mousesPOV;

  public Maze(int cellSize) {
    gap = cellSize; 
    this.width_openings = cellSize;
    startX = (int) random(cellSize,width-width_openings-cellSize);
    startX = startX - startX % cellSize;
    startY = height-cellSize;
    endX = (int) random(cellSize,width-width_openings-cellSize);
    endX = endX - endX % cellSize;
    endY = cellSize;
    pointsAll = new ArrayList<Point>();
    mousesPOV = new int[width/cellSize-2][width/cellSize-2][4];
    for(int i = 0; i < width/cellSize-2; i++) {
      for(int j = 0; j < width/cellSize-2; j ++) {
        for(int k = 0; k < 4; k++) {
          int startXConv = this.getStart().getXPos(); 
          int startYConv = this.getStart().getYPos(); 
          int endXConv = this.getEnd().getXPos();
          int endYConv = this.getEnd().getYPos();
          boolean notStart = j != startXConv || i != startYConv || k != 3;
          boolean notEnd = j != endXConv || i != endYConv || k != 1;
          if (notStart && notEnd) 
            mousesPOV[i][j][k] = 1;
        }
      }
    }
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
    int xStep = 1; 
    int yStep = 0; 
    int endOfScreen;
    if (step < 0)  
      endOfScreen = gap; 
    else 
      endOfScreen = width-gap;
    
    while (xCounter != endX-step || yCounter != endY) {


      points.add(new Point(xCounter,yCounter));
      pointsAll.add(new Point(xCounter,yCounter));
      if (xCounter == endOfScreen) {
        xStep = 0; 
        yStep = 1;
      }
      if (yCounter == gap) {
        xStep = -1; 
        yStep = 0;
      }
      xCounter += xStep * step; 
      yCounter -= yStep * abs(step);
    }

  }

  public void createMaze() {
      badPoints = new ArrayList<Point>();
      Random rnd = new Random();
      while(pointsAll.size() != badPoints.size()) { 
        int rInt = rnd.nextInt(pointsAll.size()); 
        Point p = pointsAll.get(rInt); 
        if (badPoints.contains(p))
          continue;
        makeNewLine(p,rnd); 
      }
      for (Line line: lines) {  //<>//
         line.convertLineToGridBarrier(mousesPOV);  //<>//
      } 
  }
  
  public int[][][] getMaze() {
    return mousesPOV;
  }
  
  public int getSpacing() {
    return gap;
  }
  
  public Point getStart() {
    int x = startX/gap-1;
    int y = startY/gap - 2;
    return new Point(x,y);
  }
  
  public Point getEnd() {
    int x = endX/gap-1; 
    int y = endY/gap - 1;
    return new Point(x,y);
  }

  public void makeNewLine(Point p,Random rnd) {

    ArrayList<Direction> directions = new ArrayList<Direction>(Arrays.asList(Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT));
    boolean isValid = false;
    int newX = 0;
    int newY = 0;
    int rInt;

    while (!directions.isEmpty()) { 

      rInt = rnd.nextInt(directions.size()); 
      Direction dir = directions.get(rInt);
      if (dir == Direction.UP) {
        newX = p.getXPos();
        newY = p.getYPos() - gap; 

      } else if (dir == Direction.DOWN) {
        newX = p.getXPos(); 
        newY = p.getYPos() + gap;
 
      } else if (dir == Direction.LEFT) {
        newX = p.getXPos() - gap;
        newY = p.getYPos();

      } else if (dir == Direction.RIGHT) { 
        newX = p.getXPos() + gap; 
        newY = p.getYPos();
      }
 //<>//
      if(isValidPoint(newX,newY))  
          isValid = true; 
      else 
        directions.remove(rInt); 
  //<>//
      if(isValid) {
        Point newP = new Point(newX,newY);
        pointsAll.add(newP);
        lines.add(new Line(p,newP,gap));
        break;
      }
      

    }
    if(!isValid)
      badPoints.add(p);

  }

  public boolean isValidPoint(int newX, int newY) { 
    boolean xOutRange = newX > width-gap || newX < gap;  
    boolean yOutRange = newY > height-gap || newY < gap;
    boolean outRange = xOutRange || yOutRange;
    for (Point p: pointsAll) {

      if((newX == p.getXPos() && newY == p.getYPos()) || (outRange)) { 
 
        return false;
      }  //<>//
    } 

    return true; 
  }  //<>//

  public void display() { 

    for (Line line: lines) 
      line.display();
  }

  public void updateLines() {
  lines = new ArrayList<Line>();
    for (int elt = 0; elt < pointsR.size()-1; elt++)
      lines.add(new Line(pointsR.get(elt),pointsR.get(elt+1),gap));
    for (int elt = 0; elt < pointsL.size()-1;elt++)
      lines.add(new Line(pointsL.get(elt),pointsL.get(elt+1),gap));
  }
  public int getCellSize() { 
    return gap;
  }

}