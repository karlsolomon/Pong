class Timer { 
  int timeInterval; 
  int currentTime;

  Timer(int timeInterval) {
    currentTime = 0; 
    this.timeInterval = timeInterval;
    
  }

  public boolean isTime() {
    boolean isTime = millis() - currentTime>= timeInterval;
    if (isTime) {
      currentTime = millis();
    }
    return isTime;
  }
  void toggle() { 
    currentTime = millis();  
  }
}