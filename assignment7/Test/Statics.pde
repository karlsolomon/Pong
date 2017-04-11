static class Statics {
    public static ArrayList<Bullet> bullets = new ArrayList<Bullet>();
    public static ArrayList<Bullet> inactiveBullets = new ArrayList<Bullet>();
    public static ArrayList<Ship> enemies = new ArrayList<Ship>();
    public static int waveDifficulty = 1;
    public static int topBuffer = 65;
    public static int bottomBuffer = 10;
    public ArrayList<Bullet> getBullets() {
      return bullets;
  }

}