public class BallTrail {
  //uses getRadius(), getPosition(), getVelocity(), maybe getColor()
  private PVector pos; 
  private PVector v; 
  private float r;
  int col;
  int numSqs;

  private PongBall b;
  
  public BallTrail(PongBall ball) { 
    this.b = ball;
    this.r = b.getRadius();
    this.col = b.getColor(); 
    numSqs = 8;
 
     
  }
  public void display() {
    updateSquares(); 
    createSquare(pos,v,r,col);
  }
  private void updateSquares() {
    pos = b.getPosition(); 
    v = b.getVelocity();
    col = b.getColor();
  }
  private void createSquare(PVector position, PVector velocity, float radius, int col) {
   float xPos = position.x;
   float yPos = position.y;
   float xVel = velocity.x; 
   float yVel = velocity.y;
   float xCoord;
   float yCoord;
   noStroke();
   for (int i = 1; i <= numSqs; i ++) {
     xCoord = xPos - radius/2 - 1.5*(numSqs-i)*xVel;
     yCoord = yPos - radius/2 - 1.5*(numSqs-i)*yVel;
     fill(col, (numSqs-1)*i/numSqs);
     rect(xCoord, yCoord, radius, radius);
    
   }
  }
  
}