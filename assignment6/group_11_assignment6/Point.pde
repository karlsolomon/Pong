class Point {
  private int x; 
  private int y; 
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
  
  public void setXPos(int x) {
    this.x = x;
  }
  
  public void setYPos(int y) {
    this.y = y;
  }
  
  public boolean equals(Point p) {
    return p.x == this.x && p.y == this.y;
  }
}