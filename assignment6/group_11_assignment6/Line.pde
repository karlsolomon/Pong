class Line { 
  Point s; 
  Point e;
  int gap;

  public Line(Point start, Point end,int cellSize) { 
    s = start; 
    e = end; 
    gap = cellSize;

  }
  public void display() { 

    line(s.getXPos(),s.getYPos(),e.getXPos(),e.getYPos());
  }
  boolean isVertical() {

    return s.getXPos() == e.getXPos();
  }

  void convertLineToGridBarrier(int[][][] mousesPOV) {
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
        mousesPOV[x1][y1][3] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      try {        
        mousesPOV[x2][y2][1] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      
    }
    else {
      y1 = s.getYPos() < e.getYPos() ? s.getYPos() : e.getYPos(); 
      y1 = (y1/gap) - 1; 
      y2 = y1;  
      x1 = s.getXPos()/gap - 2; 
      x2 = x1 + 1;
       try {        
        mousesPOV[x1][y1][2] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
      try {        
        mousesPOV[x2][y2][0] = 0;
      } catch (ArrayIndexOutOfBoundsException e){}
    }
  }

}