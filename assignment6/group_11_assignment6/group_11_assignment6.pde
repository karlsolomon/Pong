import java.util.*;
Maze maze;
int[][][] mouseMaze;
MouseLeft mouse1;
MouseRight mouse2;
Point start;
Point end;
int spacing;
void setup() {
 size(500,500);  
 maze = new Maze(20);
 maze.initializeFrame();
 maze.updateLines();
 maze.createMaze(); //<>//
 mouseMaze = maze.getMaze();
 spacing = maze.getSpacing();
 start = maze.getStart();
 end = maze.getEnd();
 mouse1 = new MouseLeft(start, end, spacing, mouseMaze);
 mouse2 = new MouseRight(start, end, spacing, mouseMaze); 
 frameRate(2);
}

void draw() {
  background(255);
  if(mouse1.finishedMaze() || mouse2.finishedMaze()) {
    print("Game Over");
    noLoop();
  }
  maze.display();
  mouse1.move();
  mouse2.move();
}

public enum Direction {
    LEFT, UP, RIGHT, DOWN
}