//may possibly just be scene in general and not just lane. 
public class Lane {
  protected PImage tex;
  protected PShape lane;
  int x,y,z; 
  int w,l,h;
 public Lane(int xShift, int yShift, int zShift,int w, int l, int h) {
   this.x = xShift; 
   this.y = yShift; 
   this.z = zShift;
   this.w = w; 
   this.l = l;
   this.h = h;
   tex = loadImage("laneTexture.png");
 }
  //just changed what I originally did but put into class. def needs work.
  public void display() { 
    pushMatrix();
    translate(x,y,z);
    lane = createShape(BOX,w,h,l);
    lane.setTexture(tex);
    shape(lane);
    popMatrix();
  }
  //public void FloorT(){
  //  pushMatrix();
  //  beginShape();
  //  texture(floortexture);
  //  vertex(-500, 500, 1500, 0, 0);
  //  vertex(500, 500, 1500, 1600, 0);
  //  vertex(500, 500, -1500, 1600, 1900);
  //  vertex(-500, 500, -1500, 0, 1900);
  //  endShape();
  //  //noStroke();
  //  popMatrix();
  //}
}