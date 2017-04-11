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
		while((String line = readLine()) != null {
			Char[] name = line.split(" ")[0].toCharArray();
			int score = Integer.parseInt(line.split(" ")[1]);
			allScores.add(new Score(score, name));
		}
		allScores.sort();
		return allScores;
	}
}

class Score implements Comparable {
	int score;
	Char[] name;
	public Score(int score, Char[] name) {
		this.score = score;
		this.name = name;
	}
	public String toString() {
		return new String(name) + " " + Integer.toString(score);
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