PFont font;
int maxnum;
int current;
int[] numbers;
String[] tokens;
String[] strings;
String[] lines;
String[] eyes;
Boolean SwitchButton = true;

void setup() {
  size(1200, 800);
  smooth();
  font = loadFont("BookmanOldStyle-Bold-48.vlw");
  lines = loadStrings("HairEyeColor.csv");
  numbers = new int[lines.length];
  for (int i = 1; i < lines.length; i++) {
    tokens = splitTokens(lines[i], ",");
    numbers[i] = int(tokens[4]);
  }
}

void draw() {
    drawBaseGraph();
    if (SwitchButton) {
      fill(#E3DC10);
      rect(width*.8, height/25, 175, 25);
      textAlign(CENTER);
      textSize(16);
      fill(0);
      text("Switch to line graph", width*.87+5, height/25+18);
      drawBarGraph();
      BarGraphLabel();
    } else {
      fill(#550183);
      rect(width*.8, height/25, 175, 25);
      textAlign(CENTER);
      textSize(16);
      fill(255);
      text("Switch to bar graph", width*.87+5, height/25+18);
      drawLineGraph();
      LineGraphLabel();
    }
  }

void mouseClicked() {
  if (SwitchButton) {
    if (mouseX>width*.8 && mouseX<(width*.8)+175 && mouseY>height/25 &&mouseY<height/25+25) {
      SwitchButton = false;
    }
  } else {
    if (mouseX>width*.8 && mouseX<(width*.8)+175 && mouseY>height/25 &&mouseY<height/25+25) {
      SwitchButton = true;
    }
  }
}

void drawBaseGraph() {
  background(255);
  line(100, height-100, width-60, height-100);
  line(100, height-100, 100, 100); 
  fill(0);
  textFont(font);
  textAlign(CENTER);
  text("HAIR AND EYE COLOR", width/2, height/8);
  for (int i = 1; i<numbers.length; i++) {
    current = numbers[i]*8;
    maxnum = 0;
    if (current > maxnum) {
      maxnum = current;
    }
  }
  for (int x = 101; x< width-60; x += (width-160)/4){
    line(x+(width-160)/4, height-90, x+(width-160)/4, height-100);
  }
  for (int y = 0; y< maxnum +10; y=y+10) {
    line(80, height-100-y*8, 100, height-100-y*8);
    textSize(13);
    text(y, 90, height-100-y*8);
  }
  for (int i = 1; i < lines.length/2; i=i+4) {
    eyes = splitTokens(lines[i],",");
    String xText = eyes[2];
    xText = xText.toUpperCase();
    textAlign(RIGHT);
    textSize(24);
    text(xText, (width-170)/5+65*i , height-75);
    //need to remove quotation marks.
  }
}

void drawBarGraph() {
  float w = (float)((width/numbers.length)*.9);
  for (int i = 1; i<numbers.length; i++) {
    if (i <= 16) {
      float h = numbers[i]*8;
      if (i%4==1){fill(0);}
      else if (i%4==2){fill(#A07B54);}
      else if (i%4==3){fill(#B21902);}
      else{fill(#FCFFE3);}
      rect((i*2*w)+1.3*w, height-(h+100), w*.85, h);
    } else {
      float h = numbers[i]*8;
      if (i%4==1){fill(0);}
      else if (i%4==2){fill(#A07B54);}
      else if (i%4==3){fill(#B21902);}
      else{fill(#FCFFE3);}
      rect(((i-15)*2*w)+0.21*w, height-(h+100), w*.85, h);
      fill(255);
      line(((i-15)*2*w)+0.21*w, height-(h+100), ((i-15)*2*w)+1.05*w, height-h-70);
    }
  }
}

void BarGraphLabel() {
  fill(255);
  rect(950,200,160,200);
  fill(0);
  rect(960,220,20,20);
  textAlign(LEFT);
  text("BLACK HAIR", 990,235);
  fill(#A07B54);
  rect(960,250,20,20);
  text("BROWN HAIR", 990,265);
  fill(#B21902);
  rect(960,280,20,20);
  text("RED HAIR", 990,295);
  fill(#FCFFE3);
  rect(960,310,20,20);
  fill(#F2E7BA);
  text("BLOND HAIR", 990,325);
}

void drawLineGraph() {
  float w = (float)((width/numbers.length)*.9);
  for (int i = 1; i<numbers.length; i++) {
    if (i <= 16) {
      float h = numbers[i]*8;
      if (i%4==1){fill(0);}
      else if (i%4==2){fill(#A07B54);}
      else if (i%4==3){fill(#B21902);}
      else{fill(#FCFFE3);}
      if (i < 16){
        stroke(0,0,255);
        line((i*2*w)+2.2*w,height-(h+100),((i+1)*2*w)+2.2*w,height-(numbers[i+1]*8+100));
      }
      stroke(0);
      ellipse((i*2*w)+2.2*w, height-(h+100),10,10);
    } else {
      float h = numbers[i]*8;
      if (i%4==1){fill(0);}
      else if (i%4==2){fill(#A07B54);}
      else if (i%4==3){fill(#B21902);}
      else{fill(#FCFFE3);}
      if (i>=17 && i <32){
        stroke(255,0,0);
        line(((i-16)*2*w)+2.2*w,height-(h+100),((i-15)*2*w)+2.2*w,height-(numbers[i+1]*8+100));
      }
      stroke(0);
      ellipse((i-16)*2*w+2.2*w, height-(h+100),10,10);      
    }
  }
} 

void LineGraphLabel() {
  fill(255);
  rect(950,200,160,200);
  fill(0);
  ellipse(970,230,20,20);
  textAlign(LEFT);
  text("BLACK HAIR", 990,235);
  fill(#A07B54);
  ellipse(970,260,20,20);
  text("BROWN HAIR", 990,265);
  fill(#B21902);
  ellipse(970,290,20,20);
  text("RED HAIR", 990,295);
  fill(#FCFFE3);
  ellipse(970,320,20,20);
  fill(#F2E7BA);
  text("BLOND HAIR", 990,325);
  fill(0,0,255);
  stroke(0,0,255);
  line(960,350,980,350);
  text("MALE", 990,355);
  fill(255,0,0);
  stroke(255,0,0);
  line(960,380,980,380);
  text("FEMALE",990,385);
  stroke(0);
}
  