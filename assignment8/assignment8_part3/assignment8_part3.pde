import java.util.*;
XML xml;
ArrayList<Article> nfl;
ArrayList<Article> nba;
ArrayList<Article> mlb;
ArrayList<Article> nhl;
ArrayList<Feed> feeds = new ArrayList<Feed>();
ArrayList<RadioButton> pages = new ArrayList<RadioButton>();
int topIndex = 0;
int topBuffer = 0;
Feed activeFeed;
int bottomOfLegend = 0;

void setup() {
  size(1200,800);
  noStroke();
  feeds.add(new Feed("http://www.espn.com/espn/rss/news", "Headlines", 0));
  feeds.add(new Feed("http://www.espn.com/espn/rss/nfl/news", "NFL", 1));
  feeds.add(new Feed("http://www.espn.com/espn/rss/nba/news", "NBA", 2));
  feeds.add(new Feed("http://www.espn.com/espn/rss/mlb/news", "MLB", 3));
  feeds.add(new Feed("http://www.espn.com/espn/rss/nhl/news", "NHL", 4));
  activeFeed = feeds.get(0);
  for(Feed feed : feeds) {
    pages.add(new RadioButton(feed.getName(), feeds.indexOf(feed)));
  }
  
} //<>//

void draw() {
  background(0);
  activeFeed.display();
  for(RadioButton b : pages) {
    b.display();
  }
}

void mouseClicked(MouseEvent event) {
  for(Article article : activeFeed.getArticles()) {
    article.handleClick(event);
  }
  
  for(RadioButton page : pages) {
    int clicked = page.handleClick(event);
    if(clicked != -1) {
      activeFeed = feeds.get(clicked);
      print(clicked);
    }
  }
}

void mouseWheel(MouseEvent event){
  if((activeFeed.getTopOfTable() >= 0 && event.getCount() > 0) || (activeFeed.getBottomOfTable() <= height) && event.getCount() < 0) {
    return;  //prevent from moving up/down into button space
  }
  topIndex += event.getCount();
    for(Article article : activeFeed.getArticles()) {
      article.scroll(event.getCount());
  }
  print(topIndex);
}