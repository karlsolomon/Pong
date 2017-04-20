class Article {
  XML xml;
  Button button;
  public static final int buttonHeight = 30;
  public static final int legendWidth = 500;
  private final int buttonWidth = width - legendWidth;
  private final int buttonXPos = 1;
  private color sportColor = 0;
  private String description;
  private String lastUpdated;
  
  
  public Article(XML xml, int index) {
    this.xml = xml;
    XML channel = xml.getParent();
    this.button = new Button(buttonXPos, index*buttonHeight, buttonWidth, buttonHeight, index);
    try {
      description = channel.getChild("description").getContent();
    } catch (NullPointerException e) {
      print(e.getStackTrace());
    }
    lastUpdated = channel.getChild("lastBuildDate").getContent();
  }
  
  public int getYBottom() {
    return button.y+buttonHeight;
  }
  
  public int getYTop() {
    return button.y;
  }
  
  public void display() {
    if(sportColor == 0) {
      sportColor = getColor();
      button.setColor(sportColor);
      button.setText(getTitle());
    }
    button.display();
    if(button.mouseWithin()) {
      displayDescription(width - legendWidth,buttonHeight*activeFeed.pages.size());
    }
  }
  
  public String getPageHeader() {
    String header = getDescription() + "  " + getLastUpdated();
    return header;  
  }
  
  public void displayDescription(int x, int y) {
    textAlign(LEFT);
    textSize(20);
    int spacing = 20;
    fill(255);
    text("Published: " + getPublishDate(), x,y+spacing);
  }
  
  public int getMaxButtonsOnScreen() {
    return height/buttonHeight;
  }
  
  public void scroll(int steps) {
    button.scroll(steps);
  }
  
  public String getTitle() {
    return xml.getChild("title").getContent();
  }
  
  private String getLink() {
    return xml.getChild("link").getContent();
  }
  
  public void openLink() {
    link(getLink());
  }
  
  public String getPublishDate() {
    return xml.getChild("pubDate").getContent();
  }
  
  public void handleClick(MouseEvent event) {
    if(button.isClicked(event)) {
      openLink();
    }
  }
  
  public color getColor() {
    String sport = getPage();
    int hash = sport.hashCode();
    int red = (hash & 0x00000FA);
    int green = (hash & 0x000EF00) >> 8;
    int blue = hash & ( 0x00AC0000) >> 16;
    return color(red, green, blue);
  }
  
  public String getPage() {
    String page = getLink();
    try { 
      page = page.substring("http://www.espn.com/".length());
    } catch (StringIndexOutOfBoundsException e) {
      page = page.substring("http://espndeportes.espn.com/".length());
    }
    page = page.substring(0, page.indexOf("/"));
    return page;
  } 
  
  
  String getLastUpdated(){
    return lastUpdated;
  }
  
  String getDescription() {
    return description;
  }
}