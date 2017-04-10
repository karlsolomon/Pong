//Need to implement kills and explosion, shooting
public abstract class Ship {
	private int x; 
	private int y; 
	private int speed;
	private boolean alive; 
	private int lives;
	private int killFrame;
	boolean isExploding;
	public static final float width = 20; 
	public static final float height = 20;

	Ship(int xPos, int yPos, int speed, int lives) {
		x = xPos; 
		y = yPos; 
		this.speed = speed; 
		this.lives = lives;
		alive = true; 
		killFrame = 0;
		isExploding = false;

	}
	abstract void display(); 
	abstract void display(int frame);
	abstract void shoot();

	public void move(Direction dir) {
		int displacement; 
		switch (dir) {
			case (LEFT): 
				displacement = -speed; 	
				break; 
			case (RIGHT): 
				diplacement = speed; 
				break; 
			default: 
				displacement = 0; 
				println("Invalid Direction"); 
				break;	 	
		}
		xPos += dispacement;
		
	}


	public void BulletTouching(Bullet b) {
		boolean withinLeft = b.getXPos() >= this.xPos; 
		boolean withinRight = b.getXPos() <= this.xPos; 
		boolean withinTop = b.getYPos() >= this.yPos; 
		boolean withinBottom = b.getYPos() <= this.yPos; 
		boolean withinSpace = withinLeft && withinRight && withinTop && withinBottom; 
		if (withinSpace) destroyShip();
		
	}
	public void destroyShip() {
		//run explosion animation
		lives -= 1; 
		if (lives == 0) alive = false;
		
	}
	public boolean isAlive() {
		return alive; 
	}
	protected getXPos() {
		return x;
	}
	protected getYPos() {
		return y;
	}
	public int getKillFrame() {
		return killFrame;
	}
	public void incrementKillFrame() {
		killFrame += 1; 
	}
	public boolean explosionOver() {
		return killFrame > 2; 
	}
}

public enum Direction {LEFT,RIGHT};