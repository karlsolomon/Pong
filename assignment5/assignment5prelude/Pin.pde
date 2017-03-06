class Pin {
  PShape pin;
  
  public Pin() {
    pin = loadShape("bowlingPin.obj");
  }
  
  public PShape getPinShape() {
    return pin;
  }
  
 public void display() {
  shape(pin, 0, 0, pin.width, pin.height);
 }
  
}