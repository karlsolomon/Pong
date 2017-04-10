public class TaiFighter extends Ship {

	protected PShape ship;
	public TaiFighter(int xPos, int yPos, int speed) {
		int width = Ship.width;
		int height = Ship.height;
		super(xPos,yPos,speed,1);
		ship = createShape(RECT,0,0,width,height);
		ship.setTexture("enemy.png");
	}
	public void display() {
		pushMatrix(); 
		translate(super.getXPos(),super.getYPos()) 
		rotate(PI); 
		shape(ship);
		popMatrix();
	}
	public void display(int frame) {
		PImage img = loadImage("explosion" + frame +".png"); 
		image(img, xPos, yPos);
	}
	public void shoot() {
		Bullet b = new Bullet(super.getXPos(),super.getYPos()); 
		Bullet.getBullets().add(b);	
	}



}