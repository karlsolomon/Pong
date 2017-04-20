public class GUI {
  int w; 
  int h; 
  Button[] planetButtons;
  Button[] navigationButtons;
  int numButtonsPerPage;
  int start; 
  int end;
  int page;
  int numPlanets;
  int buttonHeight;
  int navigationButtonHeight;
  GUI (int rectWidth, int rectHeight,int numPlanets) {
    w = rectWidth; 
    h = rectHeight;
    page = 1;
    numButtonsPerPage = 16;
    this.numPlanets = numPlanets;
    planetButtons = new Button[numPlanets];
    buttonHeight = height/(numButtonsPerPage+1);    
    for (int i = 0; i < numPlanets; i++) {
      Button b = new Button(width-w,4+i%numButtonsPerPage*(2+buttonHeight), w-5, (buttonHeight));
      b.setValue(i);
      planetButtons[i] = b;
      
    }
    navigationButtons = new Button[2];
    navigationButtonHeight = height - numButtonsPerPage*(2+buttonHeight)-4;
    navigationButtons[0] = new Button(width-w/4-5,height-navigationButtonHeight,w/4,navigationButtonHeight-4); 
    navigationButtons[1] = new Button(width-w,height-navigationButtonHeight,w/4,navigationButtonHeight-4); 
        

  }
  
  void display(Planet[] planets,boolean clickStatus) {
    fill(255);
    rect(width-w-2,2,w,h);
    
    stroke(0);
    for (int i = 0; i < numPlanets; i++) {
      Button b = planetButtons[i]; 
      if (b.isClicked()) planets[i].display();
    }
    updateIndices();
    for (int i = start; i < end; i++){
     
     
      Button b = planetButtons[i];
      if (b.mouseWithin()) {
        planets[i].displayDescription(width-w-2,0);
        if (clickStatus) {
          b.toggleClicked();
        }
      }
      if (b.isClicked()) {
        fill(20,80,20);
      } else {
          fill(60,60,60); 
      }
     
      b.display();
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Planet " + (i+1), width-w+w/2, (2+buttonHeight)+i%(numButtonsPerPage)*(2+buttonHeight)-buttonHeight/4);

    }
    textSize(20);
    for (int i = 0; i < navigationButtons.length; i++) {
      Button b = navigationButtons[i]; 
      
      if (b.mouseWithin()) {
        if (clickStatus && b.isActive()) {
          b.toggleClicked();
        }
      }
      if (b.isClicked()) {
        if (i == 0) page += 1; 
        else {
          page -= 1;
        }
        b.toggleClicked();
      }
      if (page == 1) navigationButtons[1].setActive(false); 
      else navigationButtons[1].setActive(true);
      int extra = 0; 
      if (numPlanets%numButtonsPerPage != 0) extra = 1;
      int maxPages = numPlanets/numButtonsPerPage + extra;
      if (page == maxPages) navigationButtons[0].setActive(false); 
      else navigationButtons[0].setActive(true);
      if (b.isActive()) {
        fill(255);
        b.display();
        fill(0);
        if (i == 0) text(">>",width-w/8,height-navigationButtonHeight/2+4);
        else text("<<",width-7*w/8, height-navigationButtonHeight/2+4);
      }  
  }
    
    
    noStroke();
  }
  void updateIndices() {
    start = (page-1)*numButtonsPerPage; 
    end = constrain(page*numButtonsPerPage,0,numPlanets);
  }
  public Button[] getPlanetButtons() {
    return planetButtons;
  }
  public ArrayList<Integer> clickedPlanetButtons() {
    ArrayList<Integer> validIndeces = new ArrayList<Integer>();
    for (Button b: planetButtons) {
      if (b.isClicked()) {
        validIndeces.add(b.getValue());
      }
    }
    return validIndeces;
  }
}