class Lights {
  ArrayList <Light> lights;
  int spacing;

  public Lights(int start,int laneLength) {
   spacing = (int)(laneLength-start)/2;
   lights = new ArrayList<Light>();
   for (int z = 1000; z >= 1000-laneLength; z = z - spacing) { 
     lights.add(new Light(width/2,height/2,z));    
   }
  }
  public void display() {
    for (Light light: lights) {
     light.display(); 
    }
  }
}



class Light {
  int x,y,z;
  public Light(int xPos, int yPos, int zPos) {
   this.x = xPos; 
   this.y = yPos;
   this.z = zPos;
  }
  public void display() {
   pointLight(255,255,255,x,y,z); 
  }
}