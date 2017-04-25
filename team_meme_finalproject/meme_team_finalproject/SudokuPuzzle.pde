public class SudokuPuzzle {
  int[][] finishedGrid;

  SudokuPuzzle(int difficulty, int size) {
    createGrid(size);
    transformGrid();


  }
  private void createGrid(int size) {
    finishedGrid = new int[size][size];
    Table originalPuzzle = loadTable("sudoku.csv","header"); 
    for (TableRow row: originalPuzzle.rows()) {
      int index1D = row.getInt("id")-1; 
      int value = row.getInt("value"); 
      finishedGrid[index1D/size][index1D%size] = value; 
    }
  }
  private void transformGrid() {
    threeRowSwitch();
  }
  private void threeColumnSwitch() {
    int col1; 
    int col2; 
    int size = finishedGrid.length;
    int[][] tempColumnsValues = new int[size/3][size];
    while (true) {
      col1 = size/3 * (int) random(size/3); 
      col2 = size/3 * (int) random(size/3); 
      if (col1 == col2) continue; 
      else break;
    }

    for (int row = 0; row < size; row++) {
      for (int columnNum = 0; columnNum < size/3; columnNum++) {
        tempColumnsValues[columnNum][row] = finishedGrid[row][col2 + columnNum]; 
        finishedGrid[row][col2 + columnNum] = finishedGrid[row][col1+columnNum]; 
      }
    }
    for (int row = 0; row < size; row++) {
      for (int columnNum = 0; columnNum < size/3; columnNum++) {
        finishedGrid[row][col1+columnNum] = tempColumnsValues[columnNum][row];
      }
    }  
  }

  private void withinBoxColumnSwitch() {
    int col1; 
    int col2;
    int size = finishedGrid.length;
    int[] tempColumnValues = new int[size];
    while (true) {
      col1 = (int) random(size); 
      int indexOfLeftEdgeOfBox = col1 - col1%(finishedGrid.length/3);
      col2 = (int) random(indexOfLeftEdgeOfBox,finishedGrid.length/3 + indexOfLeftEdgeOfBox); 
      if (col1 == col2) continue;
      else break;
    }
    for (int row = 0; row < size; row++) {
      tempColumnValues[row] = finishedGrid[row][col2];
      finishedGrid[row][col2] = finishedGrid[row][col1]; 
    }
    for (int row = 0; row < size; row++) {
      finishedGrid[row][col1] = tempColumnValues[row];
    }
  }
  private void threeRowSwitch() {
    int row1; 
    int row2; 
    int size = finishedGrid.length; 
    while (true) {
      row1 = 3 * (int) random(size/3); 
      row2 = 3 * (int) random(size/3); 
      if (row1 == row2) continue; 
      else break; 
    }
    for (int rowNum = 0; rowNum < size/3; rowNum++) {
      int[] tempRow = finishedGrid[row2 + rowNum]; 
      finishedGrid[row2 + rowNum] = finishedGrid[row1 + rowNum]; 
      finishedGrid[row1 + rowNum] = tempRow;
    }
  }
  private void withinBoxRowSwitch() {
    int row1; 
    int row2; 
    int size = finishedGrid.length;
    while (true) {
      row1 = (int) random(size); 
      int indexOfLeftEdgeOfBox = row1 - row1%(finishedGrid.length/3);
      row2 = (int) random(indexOfLeftEdgeOfBox,finishedGrid.length/3 + indexOfLeftEdgeOfBox); 
      if (row1 == row2) continue;
      else break;
    }
    int[] tempRow = finishedGrid[row2]; 
    finishedGrid[row2] = finishedGrid[row1]; 
    finishedGrid[row1] = tempRow; 
  }

  private void transpose() {
    int size = finishedGrid.length;
    int[][] tempGrid = new int[size][size];
    int[] tempRow = new int[size];
    for (int col = 0; col < size; col++) {
      for (int row = 0; row < size; row++) {
        tempRow[row] = finishedGrid[row][col];
        
      }
      tempGrid[col] = Arrays.copyOf(tempRow,size); //col means row in this case
    }
    finishedGrid = Arrays.copyOf(tempGrid,size);

  }

  private boolean isValidRow(int num, int row) {
    for (int col = 0; col < finishedGrid.length; col ++ ) {
      if (num == finishedGrid[row][col]) {
        return false;
      }
    }
    return true;
  }
  private boolean isValidColumn(int num, int col) {
    for (int row = 0; row < finishedGrid.length; row ++ ) {
      if (num == finishedGrid[row][col]) {
        return false;
      }
    }
    return true;
  }
  public void printPuzzle() {
    print("["); 
    for (int row = 0; row < finishedGrid.length; row++) {
      for (int col = 0; col < finishedGrid.length; col++) {
        print(finishedGrid[row][col]);
        print(", ");
      }
      print("]\n[");
    }
  }
}