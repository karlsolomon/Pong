class GUI{
  ArrayList ships = new ArrayList();
  PImage[] lives;
  
  public GUI(){
    lives = new PImage[3];
    for (int i = 0; i < lives.length; i++) {
      lives[i] = loadImage("ship.png");
      lives[i].resize(50,45);
    }
  }
    
  public void display(){
    generateLives();
    displayScores();
  }
  public void generateLives(){
    background(0);
    textFont(font);
    textSize(20);
    textAlign(LEFT);
    text("LIVES", 10,485);
    for (int i = 0; i < lives.length; i++){  
      image(lives[i],70+40*i,455);
    }
    line(0,456,500,456);
    stroke(255);
  }
  public void displayScores(){
    textSize(30);
    textAlign(LEFT);
    text("SCORE", 10, 20);
    textAlign(RIGHT);
    text("HI SCORE", 490, 20);
    line(0,60,500,60);
  }    
}