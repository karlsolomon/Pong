public class MillenniumFalcon extends Ship {

	protected PShape ship;
	Timer ult;
	boolean ultActive;
	public MillenniumFalcon (int xPos, int yPos, int speed) {
		int width = Ship.width; 
		int height = Ship.height;
		ultActive = false;
		super(xPos,yPos,speed,3);
		ship = createShape(RECT,0,0,width,height);
		ship.setTexture("ship.png");

	}
	public void display() {
		pushMatrix(); 
		translate(super.getXPos(),super.getYPos());
		shape(ship);
		popMatrix();
	}
	public void display(int frame) {
		PImage img = loadImage("explosion" + frame + ".png");
		image(img,super.getXPos,super.getYPos);
	}
	public void shoot() {
		if (ultActive) {
			//shoot three bullets
		} else {
			Bullet b = new Bullet(super.getXPos().super.getYPos());
			Bullet.getBullets().add(b);
		}
	}
	public void toggleUlt() {
		ultActive = !ultActive;
	}

	
}