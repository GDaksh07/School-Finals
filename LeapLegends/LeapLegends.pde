// Name - Daksh Gulati


// Player's horizontal position
int playerX = 110; 

// Player's vertical position
int playerY = 725;

// Gravity effect
int gravity = 1;

// Player's vertical speed
int velocity = 0;

// Tracks if the player is in the air
boolean isJumping = false;

// Tracks if the player is on a platform
boolean onPlatform = false; 

// Horizontal speed for smoother movement
float speed = 0;

// Sets the level
int level = -1;

// Checks if the button is pressed or not
boolean buttonPressed = false;

// Checks how many times you have died
int deathCount = 0;

// Size of the player
int playerSize = 50;

// Declares the ground
Platform Grass, Lava3, Lava51, Lava52;

// Declares platforms for level 1
Platform Level11, Level12, Level13, Level14, Level15;

// Declares platforms for level 2
Platform Level21, Level22, Level23, Level24, Level25, Level26;

// Declares platforms for level 3
Platform Level31, Level32, Level33, Level34, Level35, Level36;

// Declares platforms for level 4
Platform Level41, Level42, Level43;
Button button4;

// Declares platforms for level 5
Platform Level51, Level52, Level53, Level54, Level55, Level56, Level57, Level58;
Button button5;

// Declares the finish lines
FinishLine Finish1, Finish2, Finish3, Finish4, Finish5;

// Declares the levels for each level to select
LevelSelection level1, level2, level3, level4, level5;

void setup() {
  size(1200, 800);
  
  // Level level number, platform number
  // Level 1
  Level11 = new Platform (80, 650, 200, 20);
  Level12 = new Platform (420, 550, 200, 20);
  Level13 = new Platform (780, 470, 200, 20);
  Level14 = new Platform (450, 370, 200, 20);
  Level15 = new Platform (800, 270, 200, 20);
  
  Finish1 = new FinishLine (800, 270, 200, 20);
  
  
  // Level 2
  Level21 = new Platform (80, 650, 200, 20);
  Level22 = new Platform (420, 550, 200, 20);
  Level23 = new Platform (780, 550, 200, 20); 
  Level24 = new Platform (780, 390, 200, 20);
  Level25 = new Platform (550, 290, 200, 20);
  Level26 = new Platform (850, 190, 200, 20);
  
  Finish2 = new FinishLine (850, 190, 200, 20);
  
  
  // Level 3
  Level31 = new Platform (0, 650, 200, 20);
  Level32 = new Platform (0, 490, 200, 20);
  Level33 = new Platform (0, 340, 200, 20);
  Level34 = new Platform (0, 190, 200, 20);
  Level35 = new Platform (450, 400, 200, 20);
  Level36 = new Platform (900, 610, 200, 20);
  
  Finish3 = new FinishLine (900, 610, 200, 20);
  
  
  // Level 4
  Level41 = new Platform (350, 700, 200, 20);
  Level42 = new Platform (650, 600, 200, 20);
  Level43 = new Platform (950, 500, 200, 20);
  
  button4 = new Button (20, height - 55, 35);
  
  Finish4 = new FinishLine (950, 500, 200, 20);
  
  
  // Level 5
  Level51 = new Platform (100, 675, 200, 20);
  Level52 = new Platform (100, 525, 200, 20);
  Level53 = new Platform (100, 375, 200, 20);
  Level54 = new Platform (100, 225, 200, 20);
  Level55 = new Platform (100, 75, 200, 20);
  Level56 = new Platform (500, 675, 200, 20);
  Level57 = new Platform (850, 675, 200, 20);
  
  Finish5 = new FinishLine (850, 675, 200, 20);
  
  button5 = new Button (100, 40, 35);
  
  // Ground
  Grass = new Platform (0, height - 20, width, 20, 126, 200, 80);
  Lava3 = new Platform (260, height - 20, width, 20, 207, 16, 32);
  Lava51 = new Platform (0, height - 20, 100, 20, 207, 16, 32);
  Lava52 = new Platform (290, height - 20, width, 20, 207, 16, 32);
  
  
  // Level Selection
  level1 = new LevelSelection (275, 250, 1);
  level2 = new LevelSelection (525, 250, 2);
  level3 = new LevelSelection (775, 250, 3);
  level4 = new LevelSelection (400, 450, 4);
  level5 = new LevelSelection (650, 450, 5);
}

void draw() {
  // Sky blue background
  background(173, 216, 230);
  
  // Draws ground
  Grass.draw();
  
  
  // Draws the Levels
  drawLevels();
  
  
  // Draw player
  if (level != 0 && level != -1 && level != -2 && level != -3){
    // Red color for player
    fill(255, 0, 0);
    rect(playerX, playerY, playerSize, playerSize);
  }
  
  
  // Deathcount display
  fill (0);
  textSize(25);
  if (level != 0 && level != -1 && level != -2 && level != -3){
    text("Deaths: " + deathCount, width - 135, 30);
  }
  
  
  // Level Display
  if (level != 0 && level != -1 && level != -2 && level != -3){
    textSize (35);
    text ("Level: " + level, width / 2 - 70, 45);
  }
  
  
  // Back Button
  if (level != 0 && level != -1){
    backButton();
  }
  
  
  // Displays the start screen
  if (level == 0){
    startScreen();
  }
  
  
  // Displays the end screen
  if (level == -1){
    endScreen(); 
  }
  
  
  // Display the level selection screen
  if (level == -3){
    levelSelection();
  }
  
  
  // Movement
  // Applies gravity if not on platform
  if (!onPlatform) {
    velocity += gravity;
  }
  
  // Moves player vertically
  playerY += velocity;
  // Moves player horizontally
  playerX += speed;
  
  
  // Adds to the level counter to make it go to the next level
  checkLevel();
  
  
  // Checks if player has pressed the button / collision
  buttonPressed();
  
  
  // Determines if the player is in lava, if so the player is reset
  lava();
  
  
  // Handles Collisions
  // Makes player not go off screen
  screenCollision();
  // Makes it so player stays onto the platform
  checkCollision();
  // Mountain collision
  montainCollision();
}



// Handles movement
void keyPressed() {
  // Handle left/right movement
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    speed = -5;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    speed = 5;
  }
  
  // Jump upwards
  if ((key == 'w' || key == 'W' || keyCode == UP) && !isJumping) {
    velocity = -15;
    isJumping = true;
    onPlatform = false;
  }
}



// If movement of left and right key is released then the speed is 0
void keyReleased() {
  if (key == 'a' || key == 'A' || keyCode == LEFT || key == 'd' || key == 'D' || keyCode == RIGHT) {
    speed = 0;
  }
}



// Draws the Levels
void drawLevels (){
  // Draw levels
  if (level == 1){
    // Level 1 platforms
    Level11.draw();
    Level12.draw();
    Level13.draw();
    Level14.draw();
    Level15.draw();
    
    // Draws the finish line
    Finish1.draw();
  } else if (level == 2) {
    // Level 2 platforms
    Level21.draw();
    Level22.draw();
    Level23.draw();
    Level24.draw();
    Level25.draw();
    Level26.draw();
    
    Finish2.draw();
  } else if (level == 3){
    // Level 3 platforms
    Level31.draw();
    Level32.draw();
    Level33.draw();
    Level34.draw();
    Level35.draw();
    Level36.draw();
    
    Finish3.draw();
    
    // Draws lava
    Lava3.draw();
  } else if (level == 4){
    // Level 4 platforms
    // Draws platforms once button is pressed
    if (buttonPressed == true){
      Level41.draw();
      Level42.draw();
    }
    Level43.draw();
    
    Finish4.draw();
    
    // Draws the button
    button4.draw();
  } else if (level == 5){
    // Level 5 platforms
    Level51.draw(); 
    Level52.draw();
    Level53.draw();
    Level54.draw();
    Level55.draw();
    if (buttonPressed == true){
      Level56.draw();
      Level57.draw();
      Finish5.draw();
    }
    
    // Draws the button
    button5.draw();
    
    // Draws lava
    Lava51.draw();
    Lava52.draw();
    
    // Draws mountain
    noStroke();
    fill (135);
    rect (400, 0, width, 475);
    triangle(400, 475, 700, 475, 700, 525);
    rect (700, 475, width, 50);
  }
}



// Makes it so user can go back to main screen
void backButton(){
  // makes a back button out of a rectange and triangle on actual levels to go back to the start screen
  if (level != 0 && level != -1){
    rect (40, 40, 25, 10);
    triangle (40, 30, 40, 60, 20, 45);
  }
  
  // If button is pressed, user will go back to start screen
  if (mousePressed == true){
    if (mouseX > 15 && mouseX < 65 && mouseY > 25 && mouseY < 50){
      level = 0;
    }
  }
}



// Builds the start screen
void startScreen(){
  // Displays the start screen
  textSize (100);
  text ("Press  To  Start", 295, height / 2 + 25);
  
  textSize (30);
  text ("How to Play", width - 170, height - 50);
  text ("Level Select", 25, height - 50);
  
  // If button is pressed, user will go to level 1
  if (mousePressed == true){
    if (mouseX > 285 && mouseX < 900 && mouseY > height / 2 - 75 && mouseY < height / 2 + 25){
      level = 1;
      // Rules collision and player will be sent to level -2
    } else if (mouseX > width - 170 && mouseX < width - 25 && mouseY > height - 50 - 30 && mouseY < height - 50){
      level = -2;
      // Level Selection collision and player will be sent to level -3
    } else if (mouseX > 25 && mouseX < 170 && mouseY > height - 50 - 30 && mouseY < height - 50){
      level = -3;
    }
  }
}



// Builds the endscreen
void endScreen(){
  textSize (100);
  text ("You Win", 420, 300);
  
  textSize (80);
  text ("Restart", 465, 550);
  noFill();
  strokeWeight(5);
  rect (455, 485, 255, 75);
  strokeWeight (1);
}



// Builds the level selection screen
void levelSelection(){
  textSize (100);
  text ("Level Selection", 275, 150);
  // Draws the levels
  level1.draw();
  level2.draw();
  level3.draw();
  level4.draw();
  level5.draw();
  
  // Mouse collisions to go to each level
  if (mousePressed == true){
    if (mouseX > 275 && mouseX < 390 && mouseY > 250 && mouseY < 380){
      level = 1;
    } else if (mouseX > 525 && mouseX < 640 && mouseY > 250 && mouseY < 380){
      level = 2;
    } else if (mouseX > 775 && mouseX < 890 && mouseY > 250 && mouseY < 380){
      level = 3;
    } else if (mouseX > 400 && mouseX < 515 && mouseY > 450 && mouseY < 580){
      level = 4;
    } else if (mouseX > 650 && mouseX < 765 && mouseY > 450 && mouseY < 580){
      level = 5;
    }
  }
}



// Finish line collision
void checkLevel() {
  if (level == 1) {
    // Check collision with finish line for level and a specific distance required to activate the next level
    // Level 1 --> 2
    if (playerX - 30 > 800 && playerX < 1000 && playerY + playerSize >= 270 && playerY <= 290) {
      // Move to level 2
      level = 2;
      // Reset player position for level 2
      resetPlayerPosition();
    }
    // Level 2 --> 3
  } else if (level == 2) {
    // Check collision with finish line for level 2
    if (playerX - 30 > 850 && playerX < 1050 && playerY + playerSize >= 190 && playerY <= 210) {
      // Move to level 3
      level = 3;
      // Reset player position for level 3
      resetPlayerPosition();
    }
  } else if (level == 3){
    if (playerX - 30 > 900 && playerX < 1100 && playerY + playerSize >= 610 && playerY <= 630){
     // Move to level 4
     level = 4;
     // Reset player position for level 4
     resetPlayerPosition();
    }
  } else if (level == 4){
    if (playerX - 30 > 950 && playerX < 1150 && playerY + playerSize >= 500 && playerY <= 520){
      // Resets button
      buttonPressed = false;
      // Move to level 5
      level = 5;
      // Reset player position for level 5
      resetPlayerPosition();
    }
  } else if (level == 5){
    if (playerX - 30 > 850 && playerX < 1050 && playerY + playerSize >= 675 && playerY <= 695){
      // Resets button
      buttonPressed = false;
      // Move to level 5
      level = -1;
      // Reset player position for level 5
      resetPlayerPosition();
    }
  }
}



// Resets players position to starting point
void resetPlayerPosition() {
  // Reset characters position
  playerX = 110; 
  playerY = 725; 
  velocity = 0; 
  isJumping = false; 
  buttonPressed = false;
}



// Checks if button is pressed
void buttonPressed(){
  if (level == 4){
    if (playerX + playerSize > 20 && playerX < 55 && playerY + playerSize >= height - 55 && playerY <= height + 35){
      buttonPressed = true;
      playerY = height - 55 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  } else if (level == 5){
    if (playerX + playerSize > 100 && playerX < 135 && playerY + playerSize >= 40 && playerY <= 75){
       buttonPressed = true;
       playerY = 40 - playerSize;
       velocity = 0;
       isJumping = false;
       onPlatform = true;
    }
  }
}



// Checks for the lava to reset player
void lava(){
  if (level == 3){
    // Platform 1 collision
    if (playerX + playerSize > 260 && playerX < width && playerY + playerSize >= height - 20 && playerY <= height) {
      resetPlayerPosition();
      deathCount += 1;
    }
  } else if (level == 5){
    if (playerX + playerSize > 0 && playerX < 100 && playerY + playerSize >= height - 20 && playerY <= height ||
        playerX + playerSize > 290 && playerX < width && playerY + playerSize >= height - 20 && playerY <= height){
      resetPlayerPosition();
      deathCount += 1;
    }
  }
}



// Makes it so player does not go off the screen
void screenCollision(){
  // If player is on the left side of the screen so it won't go off
  if (playerX < 0) {
  playerX = 0;
  }
  
  // If player is on the right side of the screen so it won't go off
  if (playerX + playerSize > width) {
    playerX = width - playerSize; 
  }
}



// Adds collision to the mountain
void montainCollision(){
  if (level == 5){
    if (playerX + playerSize > 400 && playerX < width && playerY + playerSize >= 0 && playerY <= 475){
      playerX = 400 - playerSize;
    }
    
    if (playerX + playerSize > 400 && playerX < width && playerY + playerSize >= 475 && playerY <= 525){
      playerY = 525;
    }
  }
}



void checkCollision() {
  onPlatform = false;
  
  // Checks for ground collision
  if (playerY + playerSize >= height - 20) {
    playerY = height - playerSize - 20;
    velocity = 0;
    isJumping = false;
    onPlatform = true;
  }
  
  
  // Level 1 collision
  if (level == 1){
    // Platform 1 collision
    if (playerX + playerSize > 80 && playerX < 280 && playerY + playerSize >= 650 && playerY <= 670) {
      playerY = 650 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }

    // Platform 2 collision
    if (playerX + playerSize > 420 && playerX < 620 && playerY + playerSize >= 550 && playerY <= 570) {
      playerY = 550 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }

    // Platform 3 collision
    if (playerX + playerSize > 780 && playerX < 980 && playerY + playerSize >= 470 && playerY <= 490) {
      playerY = 470 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  
    // Platform 4 collision
    if (playerX + playerSize > 450 && playerX < 650 && playerY + playerSize >= 370 && playerY <= 390) {
      playerY = 370 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  
    // Platform 5 collision
    if (playerX + playerSize > 800 && playerX < 1000 && playerY + playerSize >= 270 && playerY <= 290) {
      playerY = 270 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  }
  
  
  // Level 2 collision
  if (level == 2){
    // Platform 1 collision
    if (playerX + playerSize > 80 && playerX < 280 && playerY + playerSize >= 650 && playerY <= 670) {
      playerY = 650 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
 
    // Platform 2 collision
    if (playerX + playerSize > 420 && playerX < 620 && playerY + playerSize >= 550 && playerY <= 570) {
      playerY = 550 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }

    // Platform 3 collision
    if (playerX + playerSize > 780 && playerX < 980 && playerY + playerSize >= 550 && playerY <= 570) {
      playerY = 550 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  
    // Platform 4 collision
    if (playerX + playerSize > 780 && playerX < 980 && playerY + playerSize >= 390 && playerY <= 410) {
      playerY = 390 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  
    // Platform 5 collision
    if (playerX + playerSize > 550 && playerX < 750 && playerY + playerSize >= 290 && playerY <= 310) {
      playerY = 290 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  
    // Platform 6 collision
    if (playerX + playerSize > 850 && playerX < 1050 && playerY + playerSize >= 190 && playerY <= 210) {
      playerY = 190 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  }
  
  
  // Level 3 collision
  if (level == 3){
    // Platform 1 collision
    if (playerX + playerSize > 0 && playerX < 200 && playerY + playerSize >= 650 && playerY <= 670) {
      playerY = 650 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 2 collision
    if (playerX + playerSize > 0 && playerX < 200 && playerY + playerSize >= 490 && playerY <= 510) {
      playerY = 490 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 3 collision
    if (playerX + playerSize > 0 && playerX < 200 && playerY + playerSize >= 340 && playerY <= 340) {
      playerY = 340 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 4 collision
    if (playerX + playerSize > 0 && playerX < 200 && playerY + playerSize >= 190 && playerY <= 210) {
      playerY = 190 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 5 collision
    if (playerX + playerSize > 450 && playerX < 650 && playerY + playerSize >= 400 && playerY <= 420) {
      playerY = 400 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 6 collision
    if (playerX + playerSize > 900 && playerX < 1100 && playerY + playerSize >= 610 && playerY <= 630) {
      playerY = 610 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  }
  
  
  // Level 4 collision
  if (level == 4){
    // Platforms appear when button is pressed
    if (buttonPressed == true){
      // Platform 1 collision
      if (playerX + playerSize > 350 && playerX < 550 && playerY + playerSize >= 700 && playerY <= 720) {
        playerY = 700 - playerSize;
        velocity = 0;
        isJumping = false;
        onPlatform = true;
      }
    
      // Platform 2 collision
      if (playerX + playerSize > 650 && playerX < 850 && playerY + playerSize >= 600 && playerY <= 620) {
        playerY = 600 - playerSize;
        velocity = 0;
        isJumping = false;
        onPlatform = true;
      }
    }
    
    // Platform 3 collision
    if (playerX + playerSize > 950 && playerX < 1150 && playerY + playerSize >= 500 && playerY <= 520) {
      playerY = 500 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
  }
  
  
  // Level 5 collision
  if (level == 5){
    // Platform 1 collision
    if (playerX + playerSize > 100 && playerX < 300 && playerY + playerSize >= 675 && playerY <= 695) {
      playerY = 675 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 2 collision
    if (playerX + playerSize > 100 && playerX < 300 && playerY + playerSize >= 525 && playerY <= 545) {
      playerY = 525 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 3 collision
    if (playerX + playerSize > 100 && playerX < 300 && playerY + playerSize >= 375 && playerY <= 395) {
      playerY = 375 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 4 collision
    if (playerX + playerSize > 100 && playerX < 300 && playerY + playerSize >= 225 && playerY <= 245) {
      playerY = 225 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platform 5 collision
    if (playerX + playerSize > 100 && playerX < 300 && playerY + playerSize >= 75 && playerY <= 95) {
      playerY = 75 - playerSize;
      velocity = 0;
      isJumping = false;
      onPlatform = true;
    }
    
    // Platforms appear when button is pressed
    if (buttonPressed == true){
      // Platform 6 collision
      if (playerX + playerSize > 500 && playerX < 700 && playerY + playerSize >= 675 && playerY <= 695) {
        playerY = 675 - playerSize;
        velocity = 0;
        isJumping = false;
        onPlatform = true;
      }
      
      // Platform 7 collision
      if (playerX + playerSize > 850 && playerX < 1050 && playerY + playerSize >= 675 && playerY <= 695) {
        playerY = 675 - playerSize;
        velocity = 0;
        isJumping = false;
        onPlatform = true;
      }
    }
  }
}
