// Creates a finish line pattern using a nested while for loop with black and white squares depending on where the last platforms position is

class FinishLine{
  private int squareSize = 10;
  private int rectX;
  private int rectY;
  private int widthX;
  private int heightY;
  
  // Takes in the variable for the last platform of the level
  public FinishLine (int rectX1, int rectY1, int widthX1, int heightY1){
    this.rectX = rectX1;
    this.rectY = rectY1;
    this.widthX = widthX1;
    this.heightY = heightY1;
  }
  
  // Draws the finish line in a checker pattern using a nested while / for loop
  void draw (){
   int xPos = rectX; // Makes it so rectX value is not changes
     while (xPos < rectX + widthX){
      for (int j = rectY; j < rectY + heightY; j += squareSize) {
        // Determines color
        if (((xPos / squareSize) + (j / squareSize)) % 2 == 0) {
          fill(0); // Black squares
        } else {
          fill(255); // White squares
        }

        rect(xPos, j, squareSize, squareSize); // Draws squares
      }
      xPos += squareSize; // Adds squareSize to xPos so the while loop can continue until it exceeds the restriction
    }
  }
}
