class Bullet { 
	public static ArrayList<Bullet> bullets = new ArrayList<Bullet>();
	private final float rectWidth = 5;
	private final float rectHeight = 15;
	private final float triWidth = 5;
	private final float triHeight = 5;
	private final float speed = 1;
	float x;
	float y;

	public Bullet(float x, float y) {
		this.x = x;
		this.y = y;
	}

	// Center of X
	public float getX() {
		return x + rectWidth/2;
	}

	//Top of Y
	public float getY(){
		return y + triHeight;
	}

	public void draw(){
		this.y -= speed;
		rect(x, y, width, height);
		triangle(x, y, x + triWidth/2, y - triHeight, x + triWidth, y);
	}

	ArrayList<Bullet> getBullets(){
		return Bullet.bullets;
	}
}




class Wave {
	float enemyWidth = TaiFighter.width;
	int totalEnemiesKilled = 0;
	float enemyHeight = TaiFighter.height;
	float xSpacing;
	float enemiesPerRow;
	int rows;
	int speed;
	float xGap;
	float yGap = enemyHeight;
	float ySpacing = enemyHeight*2;
	int numberOfSteps = xGap/speed;
	int step = 0;
	Timer lateralTimer;

	ArrayList<Ship> enemies;
	ArrayList<Ship> deadEnemies;
	ArrayList<Ship> recentlyDeadEnemies;

	public Wave(int numberOfEnemies, float speed, Ship user) {
		lateralTimer = new Timer(20);
		verticalTimer = new Timer(100)
		enemies = new ArrayList<TaiFighter>();
		deadEnemies = new ArrayList<TaiFighter>();
		recentlyDeadEnemies = new ArrayList<>
		initializeEnemySpacing();
		for(int i = 0; i < numberOfEnemies; i++) {
			xPos = i*(int)spacing;
			yPos = (i/(int)enemiesPerRow)*ySpacing;
			enemies.add(new Enemy(xPos, yPos, speed));
		}
	}

	private void initializeEnemySpacing() {
		float gap = 0;
		float enemiesPerRow = 0;
		float rows = 0;
		while(gap < enemyWidth) {
			rows += 1;
			enemiesPerRow = numberOfEnemies/rows;
			gap = (width/numberOfEnemies) - enemyWidth;
		}
		this.xSpacing = enemyWidth+gap;
		this.xGap = gap;
		this.rows = rows;
		this.enemiesPerRow = enemiesPerRow;
	}

	public void draw(){
		if(lateralTimer.isTime()) {
			doLateralStep();
		}
		if(verticalTimer.isTime()) {
			doVerticalStep();
		}
	}

	public void doLateralStep() {
		recentlyDeadEnemies = new ArrayList<TaiFighter>();
		for(Ship i : enemies) {
			if(!i.isAlive()) {
				recentlyDeadEnemies.add(i);
			}
		}
		for(Ship i : recentlyDeadEnemies) {
			enemies.remove(i);
		}
		totalEnemiesKilled += recentlyDeadEnemies.size();
		for(Ship i : recentlyDeadEnemies) {
			deadEnemies.add(i);
		}
		for(Ship i : deadEnemies) {
			i.incrementKillFrame();
		}
		for(Ship i : enemies) {
			if(step/numberOfSteps % 2 == 0) {
				i.move(Direction.Right);
			} else {
				i.move(Direction.Left);
			}
		}
	}

	public void doVerticalStep() {
		for(Ship i : enemies) {
			i.move(Direction.Down);
			if(i.getYPos() + enemyHeight > user.getY()) {
				user.destroyShip();
			}
		}
	}
}