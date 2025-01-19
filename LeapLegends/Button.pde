// Allows buttons to be created by the coder in specific places with exact dimentions and coodinates depending on what size the user wants the button to be

class Button{
  private int buttonX;
  private int buttonY;
  private int buttonSize;
  
  // Takes in values for what the button should look like
  public Button (int buttonX1, int buttonY1, int buttonSize1){
    this.buttonX = buttonX1;
    this.buttonY = buttonY1;
    this.buttonSize = buttonSize1;
  }
  
  // Draws the button in the set position
  void draw (){
    fill (255, 253, 208); // Fills colour Bage / White for the base
    rect (buttonX, buttonY, buttonSize, buttonSize); // Base
    fill (187, 136, 85); // Fills colour Brown for the button
    rect (buttonX + 5, buttonY - 5, buttonSize - 10, buttonSize - 30); // Actual button
  }
}
