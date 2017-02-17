public class Edge extends HardObject{
  EdgeType e;
  int[] area = new int[4];
  public Edge(EdgeType e, int x1, int y1, int x2, int y2)  {
    super(x1,y1,x2,y2);
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
    return super.shape.getVertex(0).x;
  }
  public float getRight() {
    return super.shape.getVertex(1).x; 
  }
  public float getTop() {
    return super.shape.getVertex(0).y;
  }
  public float getBottom() {
    return super.shape.getVertex(2).y;
  }
}

public enum EdgeType {Hard, Soft};