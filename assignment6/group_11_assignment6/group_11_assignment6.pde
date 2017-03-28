import java.util.*;
Maze maze;
int[][][] mouseMaze;
MouseLeft mouse1;
MouseRight mouse2;
int spacing;
Mouse winner;
Mouse loser;
void setup() {
  
 size(500,500);  
 maze = new Maze(20);
 maze.initializeFrame();
 maze.updateLines(); //<>//
 maze.createMaze();
 mouseMaze = maze.getMaze();
 spacing = maze.getSpacing();
 mouse1 = new MouseLeft(maze.getStart(), maze.getEnd(), spacing, mouseMaze);
 mouse2 = new MouseRight(maze.getStart(), maze.getEnd(), spacing, mouseMaze); 
}

void draw() {
  background(255);
  maze.display();
  if(!mouse1.finishedMaze()) {
    mouse1.move();
  }
  if(!mouse2.finishedMaze()) {
    mouse2.move();
  }
  if(mouse1.finishedMaze() && mouse2.finishedMaze()) {
    winner = mouse1.getNumberOfMoves() < mouse2.getNumberOfMoves() ? mouse1 : mouse2;    
    loser = mouse1.getNumberOfMoves() < mouse2.getNumberOfMoves() ? mouse2 : mouse1;
    noLoop();
    print("GAME OVER!\n"+ winner.toString() + " won by " + (loser.getNumberOfMoves() - winner.getNumberOfMoves()) + " moves");
  }
}

public enum Direction {
    LEFT, UP, RIGHT, DOWN
}