import java.util.*;
XML xml;
ArrayList<Article> headlines;
String description;
String lastUpdated;

void setup() {
  xml = loadXML("http://www.espn.com/espn/rss/news");
  XML channel = xml.getChild("channel");
  description = channel.getChild("description").getContent();
  lastUpdated = channel.getChild("lastBuildDate").getContent();
  
  headlines = new ArrayList<Article>();
  
  XML[] items = channel.getChildren("item");
  print("Updated: " + lastUpdated + "\n\n");
  for(XML item : items) {
    headlines.add(new Article(item));
  }
  for(Article article : headlines) {
    print("Title: " + article.getTitle() + "\n");
    print("Page: " + article.getPage() + "\n");
    print("Color: " + article.getColor() + "\n\n");
    article.openLink();
  }
} //<>//