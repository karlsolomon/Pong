public class Edge extends HardObject{
  EdgeType e;
  int[] area = new int[4];
  public Edge(EdgeType e, int x1, int y1, int x2, int y2, int col)  {
    super(x1,y1,x2,y2, col);
    this.e = e;
  }
  
  public void interact(HardObject o) {
    //DO Nothing
  }

  public int getPriority() {
    if(e == EdgeType.Hard) {
      return 0;
    }
    else {
      return 3;
    }
  }
  
  public float getLeft() {
    return super.getLeft();
  }
  public float getRight() {
    return super.getRight(); 
  }
  public float getTop() {
    return super.getTop();
  }
  public float getBottom() {
    return super.getBottom();
  }
}

public enum EdgeType {Hard, Soft};