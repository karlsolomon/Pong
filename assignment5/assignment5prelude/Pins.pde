class Pins {
  ArrayList<Pin> pins;
  HashMap<Pin, ArrayList<Float>> pinMovement;
  float z;
  float x = 250;
  float xSpacing = 60;
  float zSpacing = 60;
  boolean scattered;
  
  //Initialize in assignment5prelude p = new Pins(-1100);
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
  
  public void scatter(float stop) {
    float translate = 50;
    if(z <= stop) {
      return; // display no pins
    }
    pushMatrix();
    for(Pin p : pins) {
      p.getPinShape().translate(random(-.35,.35), 0, -translate);
      p.getPinShape().rotate(random(-.35,.35));
      p.display();
    }    
    popMatrix();
    z -= translate;
  }
  
  public void display() {
    for(Pin p : pins) {
      p.display();
    }
  }
  
  class Pin {
    PShape pin;
    float x;
    float z;
    
    public Pin(float x, float z) {
      pin = loadShape("BowlingPin.obj");
      pin.scale(10);
      pin.rotate(PI);
      pin.translate(x,0,z);
      this.z = z;
    }
    
    public PShape getPinShape() {
      return pin;
    }
    
   public void display() {
    shape(pin, x, 400, pin.width, pin.height);
   }
    
  }
}