public class MillenniumFalcon extends Ship {

  protected PShape ship;
  Timer ult;
  Timer bulletDelay;
  boolean ultActive;
  public MillenniumFalcon (int xPos, int yPos, int speed) {
    super(xPos,yPos,speed,3);
    float shipWidth = Ship.shipWidth; 
    float shipHeight = Ship.shipHeight;
    ultActive = false;
    ship = createShape(RECT,0,0,shipWidth,shipHeight);
    PImage img = loadImage("ship.png");
    ship.setTexture(img);
    bulletDelay = new Timer (250);
    

  }
  public void display() {
    pushMatrix(); 
    translate(super.getXPos(),super.getYPos());
    shape(ship);
    popMatrix();
  }
  public void display(int frame) {
    PImage img = loadImage("explosion" + frame + ".png");
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
  public void toggleUlt() {
    ultActive = !ultActive;
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