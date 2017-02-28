import ddf.minim.*;

static AudioPlayer player;
static Minim minim;

public static class SoundEffects {
  
  public static void initialize(PApplet sketch) {
    minim = new Minim(sketch);
  }
  
  public static void gameOver() {    
    player = minim.loadFile("GameOver.mp3", 2048);
    player.play();
  }
  
  public static void paddleShake() {
    player = minim.loadFile("PaddleShake.mp3", 2048);
    player.play();
  }
  
  public static void ballBounce() {
    player = minim.loadFile("BallBounce.mp3", 2048);
    player.play();
  }  
}