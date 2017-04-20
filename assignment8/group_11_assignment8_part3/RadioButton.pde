class RadioButton{
  int index;
  int x;
  int y;
  int h;
  int w;
  color unClicked = color(120,120,120);
  color clicked = color(200,50,50);
  boolean selected = false;
  String text;
  public RadioButton(String name, int index) {
    this.index = index;
    this.x = width - Article.legendWidth;
    this.y = height - Article.buttonHeight*(index+2); //<>//
    this.h = Article.buttonHeight;
    this.w = Article.legendWidth;
    setText(name);
  }
  
  
  void setText(String headline) {
    this.text = headline;
  }
  
  public boolean isClicked(MouseEvent event) {
    boolean withinLeft = event.getX() >= x; 
    boolean withinRight = event.getX() <= x+w; 
    boolean withinTop = event.getY() >= y; 
    boolean withinBottom = event.getY() <= y+h; 
    return withinLeft && withinRight && withinTop && withinBottom;
  }
  
  int handleClick(MouseEvent event) {
    if (isClicked(event)) {      
      selected = true;
      return index;
    }
    else {
      selected = false;
      return -1;
    }
  }
  
  public void display() {
    stroke(1);    
    if(selected) {
      fill(clicked);
    } else {
      fill(unClicked);
    }
    rect(x,y,w,h);
    fill(255);
    textSize(h/2);
    textAlign(LEFT);
    text(text, x, y + Article.buttonHeight - h/4);
  }
}