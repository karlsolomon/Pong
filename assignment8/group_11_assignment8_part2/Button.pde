class Button {
  boolean clicked;
  boolean isActive;
  boolean isHoveredOver;
  int x; 
  int y; 
  int w; 
  int h;
  int value;
  Button(int xPos, int yPos,int buttonWidth, int buttonHeight) {
    value = -1;
    x = xPos; 
    y = yPos; 
    w = buttonWidth; 
    h = buttonHeight; 
    clicked = false;
    isHoveredOver = false;
    isActive = true;
  }
  void display() {
    rect(x,y,w,h);
  }
  void setValue(int newValue) {
    value = newValue;
  }
  public int getValue() {
    return value;
  }
  public void setClicked(boolean newState) {
    clicked = newState;
  }
  public void toggleClicked() {
    clicked = !clicked;
  }
  void setActive(boolean newState) {
    isActive = newState;
  }
  public boolean isActive() {
    return isActive;
  }
  public boolean isClicked() {
    return clicked;
  }
  public boolean mouseWithin() {
    boolean withinLeft = mouseX >= x; 
    boolean withinRight = mouseX <= x+w; 
    boolean withinTop = mouseY >= y; 
    boolean withinBottom = mouseY <= y+h; 
    return withinLeft && withinRight && withinTop && withinBottom;
  }
}