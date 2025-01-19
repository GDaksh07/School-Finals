// Creates a platform depending on what variables are inputted, if 4 parameters are inputted it will default to the first constructor which consists of everything required to build a normal
// platform the user jumps on. The second constructor is to make anything else like the lava which once coded with collision to reset the players position for that specific part
// The player will die once and respawn

class Platform {
  private int rectX;
  private int rectY;
  private int widthX;
  private int heightY;
  private int col1; // Red component of color
  private int col2; // Green component of color
  private int col3; // Blue component of color

  // Constructor with default brown color (Normal platform)
  public Platform(int rectX1, int rectY1, int widthX1, int heightY1) {
    this.rectX = rectX1;
    this.rectY = rectY1;
    this.widthX = widthX1;
    this.heightY = heightY1;
    // Default color - brown
    this.col1 = 139;
    this.col2 = 69;
    this.col3 = 19;
  }

  // Constructor with custom color (Usually lava)
  public Platform(int rectX1, int rectY1, int widthX1, int heightY1, int col11, int col12, int col13) {
    this.rectX = rectX1;
    this.rectY = rectY1;
    this.widthX = widthX1;
    this.heightY = heightY1;
    this.col1 = col11;
    this.col2 = col12;
    this.col3 = col13;
  }

  // Draw the platform
  public void draw() {
    fill(col1, col2, col3); // Fill with the platform's color
    rect(rectX, rectY, widthX, heightY); // Draw the platform rectangle
  }
}
