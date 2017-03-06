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
   theta_step = .01;
   zTranslation = 1000; 
   colorFiller = 255;
   ball = loadShape("bowlingball.obj");
   
   
 }
 public void display() {
   if (reachedEnd()) {
     //System.out.println(((float)frameCount/60));
     return; 
   } else {
       
       pushMatrix();
       noStroke();
       fill(40,250,250);
       translate(width/2,height/2,zTranslation);
       zTranslation -= 10;
       rotateX(theta);
       theta += theta_step;
       shape(ball,0,0,ball.width,ball.height);
       popMatrix();
       stroke(0);
   }
 }
 
 public void interaction(Pins p) {
  p.scatter();
 }
 private boolean reachedEnd() {
   return (zTranslation < -200);
 }
}