public abstract class Mouse {
	protected int x;
	protected int y;
	final int xWidth;
	final int yHeight;
	protected int dir;

	protected Mouse() {
		this.health = 100;
	}

	protected enum Direction {
		LEFT, UP, RIGHT, DOWN
	};

	void updateDirection(Direction dir) {
		this.dir = dir;
	}

	void move() {
		switch(dir) {
			case LEFT:
				x -= xWidth;
			break;

			case UP:
				y -= yHeight;
			break;

			case RIGHT:
				x += xWidth;
			break;

			case DOWN:
				y += yHeight;
			break;

			default:
				System.out.println("Error: Invalid Direction");
		}
	}
}