  class Bullet { 
  private final float rectWidth = 5;
  private final float rectHeight = 15;
  private final float triWidth = 5;
  private float triHeight = 5;
  private  float speed;
  private float buffer;
  private boolean shotByUserShip;
  float x;
  float y;

  public Bullet(float x, float y, Ship shooter, Direction dir) {
    this.x = x;
    this.y = y;
    shotByUserShip = shooter instanceof MillenniumFalcon;
    switch(dir) {
      case UP: 
        speed = 10; 
        buffer = 0;
        break; 
      case DOWN: 
        speed = -10; 
        buffer = rectHeight;
        triHeight = -triHeight;
        break;
      default: 
        println("INVALID DIRECTION");
        break;
    }
  }

  // Center of X
  public float getX() {
    return x + rectWidth/2;
  }

  //Top of Y
  public float getY(){
    return y + triHeight+buffer;
  }

  public void show(){
    this.y -= speed;
    rect(x, y, rectWidth, rectHeight);
    triangle(x, y+buffer, x + triWidth/2, y - triHeight+buffer, x + triWidth, y + buffer);
  }

  public boolean shotByUserShip() {
    return this.shotByUserShip;
  }
}