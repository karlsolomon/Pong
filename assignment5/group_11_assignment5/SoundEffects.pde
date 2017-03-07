import ddf.minim.*;

static AudioPlayer player;
static Minim minim;

public static class SoundEffects {
 
  public static void initialize(PApplet sketch) {
    minim = new Minim(sketch);
  }
  public static boolean pinsHit() { 
    player = minim.loadFile("pinsHit.mp3",2048); 
    player.play();
    return true;
  }
  public static void ballRolling(boolean isRolling) { 
    player = minim.loadFile("BallRolling.mp3", 2048);
    player.play();
    if (isRolling == false) player.close();
   
  }

}