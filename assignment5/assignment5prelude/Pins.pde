class Pins {
  ArrayList<Pin> pins;
  HashMap<Pin, ArrayList<Float>> pinMovement;
  float z;
  float x = 250;
  float xSpacing = 60;
  float zSpacing = 60;
  boolean scattered;
  
  public Pins(float z) {
    this.z = z;
    scattered = false;
    
    pins = new ArrayList<Pin>();
    
    float tmpX = x;
    float tmpZ = z;
    pins.add(new Pin(x,z));
    tmpZ -= zSpacing;
    tmpX -= xSpacing/2;
    for(int i = 0; i < 2; i++) {
      pins.add(new Pin(tmpX, tmpZ));
      tmpX += xSpacing;
    }
    tmpX = x-xSpacing;
    tmpZ -= zSpacing;   
    for(int i = 0; i < 3; i++) {
      pins.add(new Pin(tmpX,tmpZ));
      tmpX += xSpacing;
    }
    
    tmpX = x-1.5*xSpacing;
    tmpZ -= zSpacing;
    for(int i = 0; i < 4; i++) {
      pins.add(new Pin(tmpX,tmpZ));
      tmpX += xSpacing;
    }    
  }
  
  public float getPosition() {
    return z + 4*zSpacing;
  }
  
  public boolean dropPins(float stop) {
    for(Pin p: pins) {
      p.drop(10);
    }
    pushMatrix();
    translate(pins.get(0).getX()+250, 400+pins.get(0).getY(), -1000);
    fill(20);
    box(200,50,5);
    fill(255);
    popMatrix();
    if(pins.get(0).getY() >= stop) {
      return true;
    }
    else {
      return false;
    }
  }
  
  public boolean scatter(float stop) {
    float translate = 50;
    print("Z = " + z + "\n");
    print("Stop = " + stop + "\n");
    if(z <= stop) {
      pins = new ArrayList<Pin>();
      return true; // display no pins
    }
    if (!scattered) {
      scattered = SoundEffects.pinsHit();
    }
    pushMatrix();
    for(Pin p : pins) {
      p.getPinShape().translate(random(-.35,.35), 0, -translate);
      p.getPinShape().rotateZ(random(-.35,.35));
      p.display();
    }    
    popMatrix();
    z -= translate;
    return false;
  }
  
  public void display() {
    for(Pin p : pins) {
      p.display();
    }
  }
  
  class Pin {
    PShape pin;
    float x;
    float y;
    float z;
    
    public Pin(float x, float z) {
      pin = loadShape("BowlingPin.obj");
      pin.scale(10);
      pin.rotate(PI);
      pin.translate(x,-500,z);
      this.y = -500;
      this.z = z;
    }
    
    public PShape getPinShape() {
      return pin;
    }
    
    public void drop(float distance) {
      pin.translate(0,distance,0);
      this.y += distance;
    }
    
    public float getY() {
      print(this.y);
      return this.y;      
    }
    
    public float getX() {
      return this.x;
    }
    
   public void display() {
    shape(pin, x, 400, pin.width, pin.height);
   }    
  }
}