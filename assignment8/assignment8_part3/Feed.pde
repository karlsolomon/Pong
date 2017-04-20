class Feed {
  ArrayList<Article> articles;
  ArrayList<Page> pages;
  String lastUpdated;
  String description;
  XML channel;
  int index;
  String pageName;
  
  public Feed(String path, String pageName, int index) {
    this.index = index;
    this.pageName = pageName;
    this.articles = new ArrayList<Article>();
    pages = new ArrayList<Page>();
    xml = loadXML(path);
    channel = xml.getChild("channel");
    description = channel.getChild("description").getContent();
    lastUpdated = channel.getChild("lastBuildDate").getContent();
    
    XML[] items = channel.getChildren("item");
    print("Updated: " + lastUpdated + "\n\n");
    for(int i = 0; i < items.length; i++) {
      Article currentArticle = new Article(items[i], i+1);
      Page page = new Page(currentArticle.getColor(), currentArticle.getPage(), pages.size());
 
      this.articles.add(currentArticle);
      boolean duplicatePage = false;
      for(Page p : pages) {
        if(page.equals(p)) {
          duplicatePage = true;
          break;
        }
      }
      if(!duplicatePage){
        pages.add(page);
      }
    }    
  }
  
  String getLastUpdated(){
    return lastUpdated;
  }
  
  String getDescription() {
    return description;
  }
  
  String getName() {
    return pageName;
  }
  
  XML getXML() {
    return channel;
  }
  
  ArrayList<Page> getPages() {
    return pages;
  }
  
  Article get(int index) {
    return this.articles.get(index);
  }
  
  int getBottomOfTable() {
    return articles.get(articles.size()-1).getYBottom();
  }
  
  int getTopOfTable() {
    return articles.get(0).getYTop();
  }
  
  int getIndex() {
    return index;
  }
  
  ArrayList<Article> getArticles() {
    return this.articles;
  }
  
  void display() {
    text(getPageHeader(),0, 15);
    for(Article a : this.articles) {
      a.display();
    }
    for(Page p : pages) {
      p.display();
    }
  }
  
    public String getPageHeader() {
    String header = getDescription() + "  " + getLastUpdated();
    return header;  
  }

  
  
}