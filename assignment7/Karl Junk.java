class Bullet { 
	private final float rectWidth = 5;
	private final float rectHeight = 15;
	private final float triWidth = 5;
	private final float triHeight = 5;
	private final float speed;
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
		this.y += speed;
		rect(x, y, width, height);
		triangle(x, y, x + triWidth/2, y - triHeight, x + triWidth, y);
	}
}




class Wave {
	float enemyWidth = TaiFighter.width;
	float enemyHeight = TaiFighter.height;
	float spacing;
	float enemiesPerRow;
	int rows;
	float gap;


	ArrayList<TaiFighter> enemies;
	public Wave(int numberOfEnemies, float speed) {
		enemies = new ArrayList<TaiFighter>();
		initializeEnemySpacing();
		for(int i = 0; i < numberOfEnemies; i++) {
			xPos = i*(int)spacing;
			yPos = 
			enemies.add(new Enemy());
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
		this.spacing = enemyWidth+gap;
		this.gap = gap;
		this.rows = rows;
		this.enemiesPerRow = enemiesPerRow;
	}



}