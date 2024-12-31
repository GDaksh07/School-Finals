class Button{
  private int buttonX;
  private int buttonY;
  private int buttonSize;
  
  public Button (int buttonX1, int buttonY1, int buttonSize1){
    this.buttonX = buttonX1;
    this.buttonY = buttonY1;
    this.buttonSize = buttonSize1;
  }
  
  void draw (){
    fill (255, 253, 208);
    rect (buttonX, buttonY, buttonSize, buttonSize);
    fill (187, 136, 85);
    rect (buttonX + 5, buttonY - 5, buttonSize - 10, buttonSize - 30);
  }
}
