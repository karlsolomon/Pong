import java.util.*;
SudokuPuzzle puzzle;
void setup() {
  size(500,500);

  puzzle = new SudokuPuzzle(3,9);
  noLoop();
}

void draw() {
  
  puzzle.printPuzzle();
}