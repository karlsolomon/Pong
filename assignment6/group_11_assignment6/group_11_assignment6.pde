import java.util.*;
Maze maze;
int[][][] mouseMaze;
MouseLeft mouse1;
MouseRight mouse2;
Point start;
Point end;
int spacing;
boolean mouseFinished = false;
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
 mouse1 = new MouseLeft(start.getXPos(), start.getYPos(), spacing, mouseMaze);
 mouse2 = new MouseRight(start.getXPos(), start.getYPos(), spacing, mouseMaze);
}

void draw() {
  if(mouseFinished) {
    print("Game Over");
    noLoop();
  }
  maze.display();
}

public enum Direction {
    LEFT, UP, RIGHT, DOWN
}