class Pins {
  ArrayList<Pin> pins;
  
  public Pins() {
    pins = new ArrayList<Pin>();
    for(int i = 0; i < 10; i++) {
      pins.add(new Pin(250,250));
    }
  }
  
  public void scatter() {
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
    
    public Pin(float x, float y) {
      pin = loadShape("BowlingPin.obj");
      pin.scale(5);
      pin.rotate(PI);
      this.x = x;
      this.y = y;
    }
    
    public PShape getPinShape() {
      return pin;
    }
    
   public void display() {
    shape(pin, x, y, pin.width, pin.height);
   }
    
  }
}