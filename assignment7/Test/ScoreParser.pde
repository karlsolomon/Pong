import java.io.*;

static class ScoreParser{
  static File highScores;
  static BufferedReader in;
  static BufferedWriter out;
  static void initialize() {
    highScores = new File("highScores.txt");
    try {
      highScores.createNewFile();
    } catch (IOException e) {
      print("must make file");
    }
    try {
      in = new BufferedReader(new FileReader("highScores.txt"));
      out = new BufferedWriter(new FileWriter("highScores.txt"));
    } catch (IOException e) {
      print("error getting reader/writer");
    }
  }

  static void addScore(Score score){
    String output = score.toString()+"\n";
    try {
      out.append(output, 0, output.length());
    } catch (IOException e) {
      print("error appending to the file");
    }
  }

  static ArrayList<Score> getSortedScores() {
    ArrayList<Score> allScores = new ArrayList<Score>(); 
    String line = "";
    while((line = in.readLine()) != null){
      String name = line.split(" ")[0];
      int score = Integer.parseInt(line.split(" ")[1]);
      allScores.add(new Score(score, name));
    }
    allScores.sort(Collections.sort);
    return allScores;
  }
  
  static ArrayList<String> getTop10Scores() {
    ArrayList<String> scores = new ArrayList<String>();
    ArrayList<String> highScores = getScoresSorted();
    for(int i = 0; i < 10; i++) {
      scores.add(highScores.get(i).toString());
    }
    return highScores;
  }
}