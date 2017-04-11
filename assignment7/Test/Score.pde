import javax.swing.*;
class Score implements Comparable<Score>{
  int score;
  String name;
  public Score(int score) {
    this.score = score;
    this.name = getNameFromUser();
  }
  public Score(int score, String name) {
    this.score = score;
    this.name = name;
  }
  
  public String toString() {
    return name + " " + Integer.toString(score);
  }
  public String getName() {
    return new String(name);
  }
  public int getScore(){
    return score;
  }
  public String getNameFromUser(){
    String name = "";  
    try { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } 
    catch (Exception e) { 
      e.printStackTrace();
    } 
    while(true) { 
      name = JOptionPane.showInputDialog(frame, "Enter Name (must be 3 characters):", "2");
        if(name.length() == 3) {
          return name;
        }  
    }
  }  
  @Override
  public int compareTo(Score o) {
    return this.score - o.score;
  }
}