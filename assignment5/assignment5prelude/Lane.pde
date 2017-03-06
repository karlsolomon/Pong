//may possibly just be scene in general and not just lane. 
public class Lane {
  
  //just changed what I originally did but put into class. def needs work.
  public void display() { 
    pushMatrix(); 
    translate(250,500,0);
    box(500,0,1500);
    popMatrix();
    pushMatrix(); 
    translate(250,500,-1000); 
    box(500,0,1000);
    popMatrix();
    pushMatrix(); 
    translate(250,500,-2000); 
    box(500,0,1000);
    popMatrix(); 
  }
}