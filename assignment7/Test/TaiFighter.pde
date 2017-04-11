public class TaiFighter extends Ship {

  protected PShape ship;
  public TaiFighter(int xPos, int yPos, int speed) {
    super(xPos,yPos,speed,1);
    float shipWidth = Ship.shipWidth;
    float shipHeight = Ship.shipHeight;

    ship = createShape(RECT,0,0,shipWidth,shipHeight);
    PImage img = loadImage("enemy.png");
    ship.setTexture(img);
  }
  public void display() {
    pushMatrix(); 
    translate(super.getXPos(),super.getYPos());
    shape(ship);
    popMatrix();
  }
  public void display(int frame) {
    PImage img = loadImage("explosion" + frame +".png"); 
    image(img, super.getXPos(), super.getYPos());
  }
  public void shoot() {
    Bullet b = new Bullet(super.getXPos()+shipWidth/2,super.getYPos(),this,Direction.DOWN); 
    Statics.bullets.add(b);  
  }
  
  public boolean isUserShip() {
    return false;
  }



}