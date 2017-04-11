static class ScoreParser{
	static File highScores;
	static BufferedReader in;
	static BufferedWriter out;
	static void initialize() {
		highScores = new File("highScores.txt");
		highScores.createNewFile();
		in = new BufferedReader(new FileReader("highScores.txt"));
		out = new BufferedWriter(new FileWriter("highScores.txt"));
	}

	static void addScore(Score score){
		String output = score.toString()+"\n";
		out.append(output, 0, output.length);
	}

	static ArrayList<Score> getSortedScores() {
		ArrayList<Score> allScores = new ArrayList<Score>(); 
		while((String line = readLine()) != null){
			String name = line.split(" ")[0];
			int score = Integer.parseInt(line.split(" ")[1]);
			allScores.add(new Score(score, name));
		}
		allScores.sort();
		return allScores;
	}
}

class Score implements Comparable {
	int score;
	String name;
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
	public int compareTo(Score o) {
		int compared = -2;
		if(this.score > o.score) {
			compared = 1;
		} else if (this.score < o.score) {
			compared = -1;
		} else {
			compared = 0;
		}
		return compared;
	}
}


//
import javax.swing.*;
public String getName(){
	String name = "";  
	try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
	while(true) { 
		name = JOptionPane.showInputDialog(frame, "Enter Name (must be 3 characters):", "2");
  		if(name.length == 3) {
  			return name;
  		}  
	}
}