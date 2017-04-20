class Page {
  color c;
  String name;
  Button b;
  public Page(color c, String name, int index) {
    this.c = c;
    this.name = name;
    this.b = new Button(width - Article.legendWidth, Article.buttonHeight*index, Article.legendWidth, Article.buttonHeight, index);
    b.setColor(c);
    b.setText(name);
    index += 1;
  }
  
  color getColor() {
    return c;
  }
  
  String getName(){
    return name;
  }
  
  void display() {
    
    bottomOfLegend = Article.buttonHeight*activeFeed.pages.size();
    b.display();
  }
  
  public boolean equals(Page o) {
    if(o.getName().equals(this.name)) {
      return true;
    } else {
      return false;
    }
  }  
}