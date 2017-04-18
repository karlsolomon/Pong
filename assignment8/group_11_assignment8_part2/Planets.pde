
class Planets {
  Timer angleChange;
  Table tableOfPlanets;
  int[] shownPlanets;
  Planet[] planets;
  public Planets(float starMass) {
    angleChange = new Timer(100);
    tableOfPlanets = loadTable("planets.csv","header");
    int rowCount = tableOfPlanets.getRowCount();
    planets = new Planet[rowCount];
    shownPlanets = new int[rowCount];
    int index = 0;
    for (TableRow row: tableOfPlanets.rows()) {
      shownPlanets[index] = 0;
      float mass = row.getFloat("mass"); 
      float period = row.getFloat("period"); 
      float eccentricity = row.getFloat("eccen");
      float thetaStart = -PI/2+index*PI/rowCount;
      Planet p = new Planet(mass,period,eccentricity,thetaStart);
      p.updateM2(starMass);
      planets[index]=p;
      index++;
    }
    
  }
  public int getNumberOfPlanets() {
    return planets.length;
  }
  public void update() {
    boolean changeAngle = false;
    if(angleChange.isTime()) changeAngle = true;
    for (int i = 0; i < getNumberOfPlanets(); i++) {
      Planet p = planets[i];
      if (changeAngle) updateAngle(p);
      //p.display();
      
    }
  }
  public void updateAngle(Planet p) {
    p.updateAngle();
  }
  public Planet[] getPlanets() {
    return planets;
  }
}