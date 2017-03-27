import java.util.*;
Maze maze;
void setup() {
 size(500,500);  
 maze = new Maze(20);
 maze.initializeFrame();
 maze.updateLines();
 //int rnd = new Random().nextInt(array.length);
}

void draw() {
  maze.display();
}