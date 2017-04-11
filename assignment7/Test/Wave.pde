class Wave {
  int enemyWidth = TaiFighter.shipWidth;
  int totalEnemiesKilled = 0;
  int enemyHeight = TaiFighter.shipWidth;
  int xSpacing = Ship.shipWidth;
  int enemiesPerRow;
  int rows;
  int cushion = 40;
  int xGap;
  int yGap = enemyHeight;
  int ySpacing = enemyHeight*6/5;
  int speed = 1;
  int numberOfSteps = cushion/speed/2;
  int step = 0;
  private boolean isDone;
  Timer lateralTimer;
  Timer verticalTimer;
  Timer shootTimer;
  Timer explosionTimer;
  ArrayList<Ship> deadEnemies;
  ArrayList<Ship> recentlyDeadEnemies;

  public Wave() {
    isDone = false;
    Statics.waveDifficulty *= 2;
    lateralTimer = new Timer(200);
    verticalTimer = new Timer(3000);
    shootTimer = new Timer(10000/Statics.waveDifficulty);
    explosionTimer = new Timer(100);
    Statics.enemies = new ArrayList<Ship>();
    deadEnemies = new ArrayList<Ship>();
    recentlyDeadEnemies = new ArrayList<Ship>();
    initializeEnemySpacing(Statics.waveDifficulty);
  }

  private void initializeEnemySpacing(int difficulty) {
    speed *=2;
    int maxEnemiesPerRow = (width-2*cushion)/Ship.shipWidth;
    int workingHeight = height - (Statics.topBuffer + Statics.bottomBuffer);
    int maxRows = workingHeight/ySpacing/2;
    int numberOfEnemies = difficulty;
    numberOfEnemies = constrain(numberOfEnemies, 1, maxEnemiesPerRow*maxRows);    
    int numberOfRows = numberOfEnemies/maxEnemiesPerRow; //<>// //<>//
    numberOfRows = constrain(numberOfRows, 1, maxRows);
    int enemiesPerRow = numberOfEnemies/numberOfRows;
    int row = 0;
    while(numberOfEnemies > maxEnemiesPerRow) {
      for(int i = 0; i < maxEnemiesPerRow; i++) {
        Statics.enemies.add(new TaiFighter(i*xSpacing+cushion, row*ySpacing+Statics.topBuffer, speed)); 
    }
      row ++;
      numberOfEnemies -= maxEnemiesPerRow;
    }
    for(int i = 0; i < numberOfEnemies; i++) {
        Statics.enemies.add(new TaiFighter(i*xSpacing+cushion, row*ySpacing+Statics.topBuffer, speed));
        print(i*xSpacing+cushion);
    }
    print("\n"+Statics.enemies.size());
  }

  public void doStep(){
    for(Ship i : Statics.enemies) {
      i.display();
    }
    if(Statics.enemies.isEmpty()) {
      this.isDone = true;
    }
    if(lateralTimer.isTime()) {
      doLateralStep();
      step+=1;
    }
    if(verticalTimer.isTime()) {
      doVerticalStep();
    }
    if(shootTimer.isTime()){
      shoot();
    }
  }

  public void shoot() {
    try {
    Statics.enemies.get((int) random(0,Statics.enemies.size())).shoot();
    }
    catch (IndexOutOfBoundsException e){}
  }
  
  public void doLateralStep() {
    recentlyDeadEnemies = new ArrayList<Ship>();
    for(Ship i : Statics.enemies) {
      if(!i.isAlive()) {
        recentlyDeadEnemies.add(i);
      }
    }
    Statics.enemies.removeAll(recentlyDeadEnemies);
    totalEnemiesKilled += recentlyDeadEnemies.size();
    deadEnemies.addAll(recentlyDeadEnemies);
    recentlyDeadEnemies = new ArrayList<Ship>();
    for(Ship i : Statics.enemies) {
      if(step/numberOfSteps % 2 == 0) {
        i.move(Direction.RIGHT);
      } else {
        i.move(Direction.LEFT);
      }
    }
  }

  public void doVerticalStep() {
    for(Ship i : Statics.enemies) {
      i.move(Direction.DOWN);
      if(i.getYPos() + enemyHeight > user.getYPos()) {
        user.destroyShip();
      }
    }
  }
  public int getKillCount() {
    return totalEnemiesKilled;
  }
  
  public boolean isDone() {
    return isDone;
  }
}