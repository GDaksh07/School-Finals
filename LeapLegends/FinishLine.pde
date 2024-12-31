class FinishLine{
  private int squareSize = 10;
  private int rectX;
  private int rectY;
  private int widthX;
  private int heightY;
  
  public FinishLine (int rectX1, int rectY1, int widthX1, int heightY1){
    this.rectX = rectX1;
    this.rectY = rectY1;
    this.widthX = widthX1;
    this.heightY = heightY1;
  }
  
  
  void draw (){
    for (int i = rectX; i < rectX + widthX; i += squareSize) {
      for (int j = rectY; j < rectY + heightY; j += squareSize) {
        // Determines color
        if (((i / squareSize) + (j / squareSize)) % 2 == 0) {
          // Black squares
          fill(0);
        } else {
          // White squares
          fill(255); 
        }

        // Draws squares
        rect(i, j, squareSize, squareSize);
      }
    }
  }
}
