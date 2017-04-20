class Button {
  boolean clicked;
  boolean isActive;
  boolean isHoveredOver;
  int x; 
  int y; 
  int w; 
  int h;
  int index;
  color fillColor = 0;
  String text = "";
  Button(int xPos, int yPos,int buttonWidth, int buttonHeight, int index) {
    this.index = index;
    x = xPos; 
    y = yPos; 
    w = buttonWidth; 
    h = buttonHeight; 
    clicked = false;
    isHoveredOver = false;
    isActive = true;
  }
  void display() {
    stroke(1);
    fill(fillColor); 
    rect(x,y,w,h);
    fill(0);
    textSize(h/2);
    textAlign(LEFT);
    text(text, x+20, y + Article.buttonHeight - h/4);
  }
  void setText(String headline) {
    this.text = headline;
  }
  void scroll(int steps) {
    this.y += 10*steps;
  }
  
  void setColor(color fillColor) {
    this.fillColor = fillColor;
  }
  
  public boolean mouseWithin() {
    boolean withinLeft = mouseX >= x; 
    boolean withinRight = mouseX <= x+w; 
    boolean withinTop = mouseY >= y; 
    boolean withinBottom = mouseY <= y+h; 
    return withinLeft && withinRight && withinTop && withinBottom;
  }
  
  public boolean isClicked(MouseEvent event) {
    boolean withinLeft = event.getX() >= x; 
    boolean withinRight = event.getX() <= x+w; 
    boolean withinTop = event.getY() >= y; 
    boolean withinBottom = event.getY() <= y+h; 
    return withinLeft && withinRight && withinTop && withinBottom;
  }
}