public class Ball {
 int r; 
 float theta; 
 float theta_step;
 float zTranslation;
 float colorFiller;
 PShape ball;

  
 public Ball(int radius)  {
   this.r = radius;
   theta = 0;
   theta_step = .03;
   zTranslation = 1000; 
   colorFiller = 255;
   ball = loadShape("BowlingBallBig.obj");
   ball.setFill(color(200,0,0));   

 }
 public void display() {
   if(getPosition() > -1300) {
     pushMatrix();
     noStroke();
     fill(40,250,250);
     translate(width/2,height/2,zTranslation);
     zTranslation -= 10;
     rotateX(theta);
     rotateY(theta);
     theta += theta_step;
  
     shape(ball,0,0,ball.width,ball.height);
     popMatrix();
     stroke(0);
   }
   else {
     return;
   }
 }
 
 public void interaction(Pins p) {
  //if (zTranslation-ball.width/2 >= p.getOffSet()) {
  //  p.scatter();
  //}
  
 }


 private float getPosition() {
   return zTranslation;

 }
}