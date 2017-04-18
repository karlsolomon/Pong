class Planet {
  float m1;
  float m2; //mass of object planet is orbitting
  float t; 
  float e;
  float x; 
  float y;
  float r;
  float radiusMultiplier;
  float theta;
  float startX; 
  float startY;
  float thetaInit;
  color aColor;
  Planet(float mass, float period, float eccentricity, float thetaStart) {
    m1 = mass; 
    t = period; 
    e = eccentricity;
    radiusMultiplier = 3;
    r = massToRadius(mass);
    thetaInit = thetaStart;
    updateStartPosition(); 
    aColor = color(random(255),random(255),random(255));
  }
  public void updateStartPosition() {
    startX = width/2;
    startY = height/2;
  }
  public void display() {
    updatePosition();
    fill(aColor);
    ellipse(x,y,r,r);
  }
  private float massToRadius(float mass) {
    return (float)Math.sqrt(mass*10)*radiusMultiplier;
  }
  private float radius(float theta) {
    float c = massToRadius(m2);
    return c/(1+e*(float)Math.cos(theta));
  }
  public void updatePosition() {
    x = startX + radius(theta-thetaInit)*(float)Math.cos(theta);
    y = startY - radius(theta-thetaInit)*(float)Math.sin(theta);
  }
  public void updateAngle() {
    this.theta += 2*PI/t;
  }
  public void updateM2(float radius) {
    float mass = (float)Math.pow(radius,2)/(10*radiusMultiplier) - 10;
    m2 = mass;
  }
  public float getAngle() {
    return theta;
  }
  public float getPeriod() {
    return t;
  }
  public float getEccentricty() {
    return e;
  }
  public void displayDescription(int x, int y) {
    textAlign(RIGHT);
    textSize(20);
    int spacing = 20;
    fill(255);
    text("Mass: " + m1, x,y+spacing);
    text("Period: " + t, x, y+spacing*2); 
    text("Eccentricity: " + e, x, y+spacing*3);
  }

}