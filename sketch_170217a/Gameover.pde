class Gameover {
 int x; 
 int y;
 String gameover = "GAMEOVER"; 
 String restart = "Press \"n\" to start a new game.";
 float sw;
 float theta;
 public Gameover(int x, int y) {
   this.x = x; 
   this.y = y; 
 }
 public void display() {
  SoundEffects.gameOver();
  fill(0);
  translate(width/2,height/2);
  rotate(theta);
  textSize(y/10);
  theta+=0.03;
  textAlign(CENTER);
  text(gameover,0,0);
  sw = textWidth(gameover); 
  textAlign(CENTER);
  textSize(y/20); 
  sw = textWidth(restart); 
  text(restart, 0, 30);
  loop();
  if (theta > 2*PI){
    noLoop();
  }
 }
}