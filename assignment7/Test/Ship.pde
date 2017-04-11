public abstract class Ship {
  private int x; 
  private int y; 
  private int speed;
  private boolean alive; 
  private int lives; 
  boolean invulnerable;
  public static final int shipWidth = 40; 
  public static final int shipHeight = 40;
  Timer invulnerabilityTimer;
  protected boolean ultAvailable;

  Ship(int xPos, int yPos, int speed, int lives) {
    x = xPos; 
    y = yPos; 
    this.speed = speed; 
    this.lives = lives;
    alive = true; 
    invulnerable = false;
    ultAvailable = false;
  }
  
  abstract boolean isUserShip();
  abstract void display(); 
  abstract void display(int frame);
  abstract void shoot();

  public void move(Direction dir) {
    int displacement = 0; 
    switch (dir) {
      case LEFT: 
        displacement = -speed;   
        break; 
      case RIGHT: 
        displacement = speed; 
        break; 
      case DOWN: 
        y += speed; 
        break;
      default:  
        println("Invalid Direction"); 
        break;     
    }
    x += displacement;
    
  }


   public void bulletTouching(Bullet b) { //<>// //<>//
    boolean withinLeft = b.getX() >= x; 
    boolean withinRight = b.getX() <= x + Ship.shipWidth; 
    boolean withinTop = b.getY() >= y; 
    boolean withinBottom = b.getY() <= y + Ship.shipHeight; 
    boolean withinSpace = withinLeft && withinRight && withinTop && withinBottom; 
      
    if (withinSpace && differentTypes(b) && !invulnerable) {
      destroyShip();
      Statics.inactiveBullets.add(b);
    }
  }
  
  private boolean differentTypes(Bullet b){
    return b.shotByUserShip() ^ (this instanceof MillenniumFalcon);
  }
  
  public void destroyShip() {
    lives -= 1;
    if (lives == 0) alive = false;
    if (alive) {
      ultAvailable = true;
      x = 250;
      invulnerable = true;
      invulnerabilityTimer = new Timer(1000);
    }
  }
  public boolean isAlive() {
    return alive; 
  }
  protected int getXPos() {
    return x;
  }
  protected int getYPos() {
    return y;
  }
  protected void setXPos(int newX) {
    x =  newX;
  }
  protected void setYPos(int newY) {
    y = newY; 
  }
  protected Timer getInvulnerabilityTimer() {
    return invulnerabilityTimer;
  }
  protected boolean isInvulnerable() {
    return invulnerable; 
  }
  protected void setInvulnerability(boolean state) {
    invulnerable = state;
  }
  public int getLives() {
    return lives;
  }
}

public enum Direction {LEFT,RIGHT,DOWN,UP};