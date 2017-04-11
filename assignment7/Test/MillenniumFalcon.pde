public class MillenniumFalcon extends Ship {

  protected PShape ship;
  Timer ult;
  Timer bulletDelay;
  boolean ultAvailable;
  boolean ultActive;
  public MillenniumFalcon (int xPos, int yPos, int speed) {
    super(xPos,yPos,speed,Statics.lives);
    float shipWidth = Ship.shipWidth; 
    float shipHeight = Ship.shipHeight;
    ultAvailable = true;
    ultActive = false;
    ship = createShape(RECT,0,0,shipWidth,shipHeight);
    PImage img = loadImage("ship.png");
    ship.setTexture(img);
    bulletDelay = new Timer (250);
    

  }
  public void display() {
    gui.display(Statics.killCount*200,super.getLives());

    if (this.isInvulnerable()) {
      ultAvailable = true;
      if (this.getInvulnerabilityTimer().isTime()) {
        this.setInvulnerability(false);
      }
    }
    if (ultActive) {
      if (ult.isTime()) {
        ultActive = false;
      }
    }
    pushMatrix(); 
    translate(super.getXPos(),super.getYPos());
    shape(ship);
    popMatrix();
    
  }
  public void display(int frame) {
    PImage img = loadImage("explosion" + frame + ".png");
    img.resize(shipWidth,shipHeight);
    image(img,super.getXPos(),super.getYPos());
  }
  public void shoot() {
    int maxBullets = 3;
    Bullet b;
    if (ultActive && bulletDelay.isTime()) {
      for (int i = -1; i < maxBullets-1; i++ ) {
        b = new Bullet(super.getXPos()+ (shipWidth-shipWidth/8)/2 + i*shipWidth/4,super.getYPos(),this,Direction.UP);
        Statics.bullets.add(b);
      }
    } else if (bulletDelay.isTime()){
      b = new Bullet(super.getXPos()+(shipWidth-shipWidth/8)/2,super.getYPos(),this,Direction.UP);
      Statics.bullets.add(b);
    }
  }
  public boolean isUltAvailable() {
    return ultAvailable; 
  }
  public boolean isUltActive() {
   return ultActive; 
  }
  public void setUltActivity(boolean state) {
    ultActive = state;
    if (state){
      ult = new Timer(5000);
      ultAvailable = false;
    }
  }
    

  public boolean withinLeft() {
      return super.getXPos() > 0; 
  }
  public boolean withinRight() {
    return super.getXPos() < width - Ship.shipWidth;
  }
  public boolean isUserShip() {
    return true;
  }

  
}