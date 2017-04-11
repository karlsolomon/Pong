class GUI{
  ArrayList ships = new ArrayList();
  PImage[] life;
  int lives = 3;
  
  public GUI(){
    life = new PImage[lives];
    for (int i = 0; i < life.length; i++) {
      life[i] = loadImage("ship.png");
      life[i].resize(50,45);
    }
  }
    
  public void display(int score,int lives){
    generateLives(lives);
    displayScores(score);
  }
  public void generateLives(int lives){
    background(0);
    textFont(font);
    textSize(20);
    textAlign(LEFT);
    text("LIVES", 10,485);
    stroke(#1CD332);
    for (int i = 0; i < lives; i++){  
      image(life[i],70+40*i,455);
    }
    line(0,456,500,456);
  }
  
  public void displayScores(int score){
    textSize(34);
    textAlign(LEFT);
    text("SCORE", 10, 20);
    text(nf(score,6), 10,40);
    textAlign(RIGHT);
    text("HI SCORE", 490, 20);
    text(nf(score,6), 490,40);
    line(0,42,500,42);
  }    
}