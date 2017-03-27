import java.util.*;
Maze maze;
void setup() {
 size(500,500);  
 maze = new Maze(20);
 maze.initializeFrame();
 maze.updateLines();
 maze.createMaze(); //<>//
 
}

void draw() {
  maze.display();
}

public enum Direction {
    LEFT, UP, RIGHT, DOWN
}