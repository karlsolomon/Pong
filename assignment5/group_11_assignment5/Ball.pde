public class Ball { 
 float theta; 
 float theta_step;
 float zTranslation;
 PShape ball;

  
 public Ball()  {

   theta = 0;
   theta_step = .1;
   zTranslation = 1000; 
   ball = loadShape("BowlingBallBig.obj");
   ball.setFill(color(200,0,0));   

 }
 public void display() {
   if(getPosition() > -1200) {
     pushMatrix();
     noStroke();
     translate(width/2,ball.width+height/2,zTranslation);
     zTranslation -= 15;
     rotateX(theta);
     rotateY(theta);
     theta += theta_step;
  
     shape(ball,0,0,ball.width,ball.height);
     popMatrix();
     stroke(0);
   }
   else {
     zTranslation -= 15;
     return;
   }
 }
 


 private float getPosition() {
   return zTranslation;

 }
}