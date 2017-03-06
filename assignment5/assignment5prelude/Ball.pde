public class Ball {
 int r; 
 float theta; 
 float theta_step;
 float zTranslation;
 float colorFiller;
  
 public Ball(int radius)  {
   this.r = radius;
   theta = 0; 
   theta_step = .01;
   zTranslation = 0; 
   colorFiller = 255;
   
   
 }
 public void display() {
   pushMatrix();
   fill(colorFiller);
   translate(width/2,height/2,1000+zTranslation);
   zTranslation -= 10;
   rotateX(theta);
   theta += theta_step;
   sphere(r);
   popMatrix();
 }
 
 public void interaction(Pin p) {
  //Placeholder 
 }
}