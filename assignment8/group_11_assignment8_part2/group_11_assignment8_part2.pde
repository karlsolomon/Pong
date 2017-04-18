import java.util.*;
Planets planets;
GUI gui;
float radiusStar;
boolean clicked;

void setup() {
  size(1600,900);
  noStroke();
  background(0);
  radiusStar = 80;
  planets = new Planets(radiusStar);
  gui = new GUI(350,height-4,planets.getNumberOfPlanets());
  clicked = false;
}

void draw() {
  background(0);
  fill(255);
  ellipse(width/2,height/2,radiusStar,radiusStar);
  gui.display(planets.getPlanets(),clicked);
  planets.update();
  clicked = false;


}

void mouseClicked() {
  clicked = true;
}