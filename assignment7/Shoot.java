class Shoot implements Runnable {
	MilleniumFalcon user;
	private boolean dead = false;
	public Shoot(MilleniumFalcon user) {
		this.user = user;
	}

	public void run() {
		while(!dead) {
			if(keyPressed) {
				if(key == " ") {
					user.shoot();
				}
			}
		}
	}
}