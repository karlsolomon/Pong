 
class Article {
  XML xml;
  public Article(XML xml) {
    this.xml = xml;
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
  
  public color getColor() {
    String sport = getPage();
    int hash = sport.hashCode(); 
    int red = (hash & 0x000000FF);
    int green = (hash & 0x0000FF00) << 8;
    int blue = hash & ( 0x00FF0000) << 16;
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
}