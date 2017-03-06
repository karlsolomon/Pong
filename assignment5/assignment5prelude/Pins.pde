class Pins {
  ArrayList<Pin> pins;
  float z;
  float x = 250;
  float xSpacing = 60;
  float zSpacing = 60;
  float theta =0 ; 
  float theta_step = 0.3;
  float zTranslation;
  
  
  public Pins(float z) {
    this.z = z;
    
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
  
  public float getOffset() {
    return z;
  }
  
  public void scatter() {
    pushMatrix();
    rotateX(theta);
    rotateY(theta);
    rotateZ(-theta);
    theta += theta_step;

   // shape(p,x,400,p.width,p.height);
    popMatrix();
    
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