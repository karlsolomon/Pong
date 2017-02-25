class Gameover {
 int x; 
 int y;
 String gameover = "GAMEOVER"; 
 String restart = "Press \"n\" to start a new game.";
 float sw;
 public Gameover(int x, int y) {
   this.x = x; 
   this.y = y; 
 }
 public void display() {
  fill(255);
  textSize(y/10);
  sw = textWidth(gameover); 
  text(gameover, (x - sw)/2,y/2);
  textSize(y/20); 
  sw = textWidth(restart); 
  text(restart, (x - sw)/2, y/2 + y/18);
 }
 
}