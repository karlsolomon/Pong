import ddf.minim.*;
AudioPlayer gameOver;
AudioPlayer ballBounce;
AudioPlayer paddleShake;
Minim minim;

public class SoundEffects {
  private SoundEffects instance = null;
  
  private SoundEffects() {
    gameOver = minim.loadFile("GameOver.mp3", 2048);
    ballBounce = minim.loadFile("BallBounce.mp3", 2048);
    paddleShake = minim.loadFile("PaddleShake.mp3", 2048);
  }
  
  public SoundEffects getInstance() {
    if(instance == null) {
      instance = new SoundEffects();
    }
    return instance;
  }
  
  public void gameOver() {
    gameOver.play();
  }
  
  public void paddleShake() {
    paddleShake.play();
  }
  
  public void ballBounce() {
    ballBounce.play();
  } 
  
}