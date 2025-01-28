/* Name - Daksh Gulati
Date - 1/22/25
Purpose - The purpose of this code is to play a simple platformer. Jumping from one platform to another to reach the finish line of each level. This game consists of 5 levels total
          and many other screens like a start, end, how to play and a level selection screen. 
*/

// Coodinates of the player
int playerX = 110; // Player's horizontal position
int playerY = 725; // Player's vertical position

// Variables for the player jumping or falling with different speeds
int gravity = 1; // Gravity effect
int velocity = 0; // Player's vertical speed
boolean isJumping = false; // Tracks if the player is in the air
boolean onPlatform = false; // Tracks if the player is on a platform

float speed = 0; // Horizontal speed for smoother movement

int level = 0; // Sets the level

boolean buttonPressed = false; // Checks if the button is pressed or not

// Background colour depending on if left click or right click is pressed
color c1 = color (173, 216, 230); // Blue colour
color c2 = color (186, 85, 211); // Purple colour
int colour = 0;

int deathCount = 0; // Counts how many times you have died

int playerSize = 50; // Size of the player

// Creates variables for 2 images
PImage logoBlue; // Blue version of the image
PImage logoPurple; // Purple version of the image

// Declaration of variables for different classes
Platform Grass, Lava3, Lava51, Lava52; // Declares the ground
Platform Level11, Level12, Level13, Level14, Level15; // Declares platforms for level 1
Platform Level21, Level22, Level23, Level24, Level25, Level26; // Declares platforms for level 2
Platform Level31, Level32, Level33, Level34, Level35, Level36; // Declares platforms for level 3
Platform Level41, Level42, Level43; // Declares platforms for level 4
Platform Level51, Level52, Level53, Level54, Level55, Level56, Level57, Level58; // Declares platforms for level 5
Button button4, button5; // Declares the buttons
FinishLine Finish1, Finish2, Finish3, Finish4, Finish5; // Declares the finish lines
LevelSelection level1, level2, level3, level4, level5; // Declares the levels for each level to select


void setup() {
  size(1200, 800);
  
  background(c1); // Sky blue background at the start of the game
  
  // Creates the objects
  // Each platform is written by: level level number, platform number
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
  
  // Adds the image to the code
  logoBlue = loadImage ("Leap Legends Blue.png"); // Blue background
  logoPurple = loadImage ("Leap Legends Purple.png"); // Purple background
}

void draw() {
  /* The purpose of this draw is to use multiple methods that include drawLevels(), backButton(), startScreen(), endScreen(), howToPlay(), levelSelection(), checkLevel(),
  buttonPressed(), lava(), screenCollision(), checkCollision(), mountainCollision(). All these methods are used to work sidebyside to use collisions, checking lava or levels and different screens
  like the start, end, how to play and level selection screens to elevate the users experience. There is a background change inside which allows the user to switch between a purple or blue 
  background. Adding different displays like deathcount and showing which level the user is on. Lastly the draw includes the movement of the player, moving left and right by using in built methods
  to assist the movement but not only left and right are in the draw, but also the jump, the jump is useful for the player to go from platform to platform. Jumping has many mechanics which
  the user will have to figure out on their own.
  */
  
  
    // The user is able to change the background colour
    // Sky blue background (will initially start as a sky blue colour) if left mouse button is clicked
    if (colour == 0){
      background (c1);
    } else if (colour == 1){
      // Purple background if right mouse button is clicked
      background (c2);
    }
  
  Grass.draw(); // Draws the grass
  
  drawLevels(); // This is a custom method that draws the levels (1 to 5)
  
  // Draw player
  if (level != 0 && level != -1 && level != -2 && level != -3){
    // Red color for player
    fill(255, 0, 0);
    rect(playerX, playerY, playerSize, playerSize);
  }
  
  
  // Deathcount display
  fill (0); // Makes the colour of the text to black
  textSize(25); // Changes the size of the text to 25
  if (level != 0 && level != -1 && level != -2 && level != -3){
    text("Deaths: " + deathCount, width - 135, 30); // Outputs the deathcount on level screens
  }
  
  
  // Level Display
  if (level != 0 && level != -1 && level != -2 && level != -3){
    textSize (35); // Changes the size of the text to 35
    text ("Level: " + level, width / 2 - 70, 45); // Outputs the level display on level screens
  }
  
  
  // Back Button
  if (level != 0){
    backButton(); // This is a custom method that draws the back button and adds functionallity to it so it can go back to the start screen
  }
  
  
  // Displays the start screen
  if (level == 0){
    startScreen(); // This is a custom method to display the start screen
  }
  
  
  // Displays the end screen
  if (level == -1){
    endScreen(); // This is a custom method to display the end screen
  }
  
  
  // Displays the how to play screen
  if (level == -2){
    howToPlay(); // This is a custom method to display the how to play screen
  }
  
  
  // Display the level selection screen
  if (level == -3){
    levelSelection(); // This is a custom method to display the level selection screen
  }
  
  
  // Movement
  // Movement of the different keys will be in the different key methods under the draw
  // Applies gravity if not on platform
  // This is done by removing the vertical velocity slowly that is intially given by jumping until the user is going downwards / upwards until they land on a platform
  if (!onPlatform) {
    velocity += gravity;
  }
  
  playerY += velocity; // Moves player vertically
  playerX += speed; // Moves player horizontally
  
  checkLevel(); // This is a custom method that adds to the level counter to make it go to the next level
  
  buttonPressed(); // This is a custom method that checks if player has pressed the button
  
  lava(); // This is a custom that determines if the player is in lava, if so the player is reset
  
  
  // Handles Collisions
  screenCollision(); // This is a custom method that makes player not go off screen
  checkCollision(); // This is a custom method that makes it so player stays onto the platform
  montainCollision(); // This is a custom method that adds mountain collision
}



// Handles movement
void keyPressed() {
  // Handle left/right movement
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    speed = -5; // Player moves left
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    speed = 5; // Player moves right
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
    speed = 0; // Makes player stop moving left or right
  }
}



// Depending on which mouse button is pressed the background will change
void mousePressed(){
  if (mouseButton == LEFT){
    colour = 0; // Blue colour
  } else if (mouseButton == RIGHT){
    colour = 1; // Purple colour
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
    stroke(0);
  }
}



// Makes it so user can go back to main screen
void backButton(){
  // makes a back button out of a rectange and triangle on actual levels to go back to the start screen
    rect (40, 40, 25, 10);
    triangle (40, 30, 40, 60, 20, 45);
  
  // If button is pressed, user will go back to start screen
  if (mousePressed == true){
    if (mouseX > 15 && mouseX < 65 && mouseY > 25 && mouseY < 50){
      level = 0; // Sets level to 0
      deathCount = 0; // Sets deathcount to 0
    }
  }
}



// Builds the start screen
void startScreen(){
  // Displays the start screen
  textSize (100); // Makes text size 100
  text ("Press  To  Start", 295, height / 2 + 25);
  
  textSize (30); // Makes text size 30
  text ("How to Play", width - 170, height - 50);
  text ("Level Select", 25, height - 50);
  
  // If button is pressed, user will go to level 1
  if (mousePressed == true){
    if (mouseX > 285 && mouseX < 900 && mouseY > height / 2 - 75 && mouseY < height / 2 + 25){
      level = 1; // If "Press to start" is pressed
      // Rules collision and player will be sent to level -2
    } else if (mouseX > width - 170 && mouseX < width - 25 && mouseY > height - 50 - 30 && mouseY < height - 50){
      level = -2; // If "How to play" is pressed
      // Level Selection collision and player will be sent to level -3
    } else if (mouseX > 25 && mouseX < 170 && mouseY > height - 50 - 30 && mouseY < height - 50){
      level = -3; // If "Level selection" is pressed
    } 
  }
  
  if (colour == 0){
    image (logoBlue, 110, 50, 1000, 250); // Adds the logo in blue
  } else if (colour == 1) {
    image (logoPurple, 110, 32, 1000, 280); // Adds the logo in purple
  }
}



// Builds the endscreen
void endScreen(){
  textSize (100); // Makes text size 100
  text ("You Win", 420, 300);
  
  // Creates the restart button
  textSize (80); // Makes text size 80
  text ("Restart", 465, 550);
  noFill();
  strokeWeight(5); // Makes strokeWeight to 5
  rect (455, 485, 255, 75);
  // Everything else below will have a stroke rather than a higher strokeWeight
  strokeWeight (1); // Makes strokeWeight to 1 so nothing else if affected
  
  deathCount = 0; // Sets deathcount to 0 so player can restart the game with a fresh start
  
  if (mousePressed == true){
    if (mouseX > 455 && mouseX < 710 && mouseY > 485 && mouseY < 560){
      level = 1; // Sets level to 1 if the "restart" button is pressed
    }
  }
}



// Builds the howToPlay screen
void howToPlay(){
  textSize(25); // Makes text size 25
  text("1. Move by pressing w, a and d or using arrow keys", 20, 125);
  text("2. Go platform to platform to make it to the finish line of each level", 20, 200);
  text("3. Be sure to go into the finish line all the way so you will move onto the next level", 20, 275);
  text("4. Find out new features and ways to platform across", 20, 350);
  text("5. Press left mouse button to make the background blue and right click to make it purple", 20, 425);
  text("6. Have fun", 20, 500);
}



// Builds the level selection screen
void levelSelection(){
  textSize (100); // Makes text size 100
  text ("Level Selection", 275, 150);
  // Draws the level selection for each level
  level1.draw();
  level2.draw();
  level3.draw();
  level4.draw();
  level5.draw();
  
  // Mouse collisions to go to each level
  if (mousePressed == true){
    if (mouseX > 275 && mouseX < 390 && mouseY > 250 && mouseY < 380){
      level = 1; // Goes to level 1 if level 1 is pressed
    } else if (mouseX > 525 && mouseX < 640 && mouseY > 250 && mouseY < 380){
      level = 2; // Goes to level 2 if level 2 is pressed
    } else if (mouseX > 775 && mouseX < 890 && mouseY > 250 && mouseY < 380){
      level = 3; // Goes to level 3 if level 3 is pressed
    } else if (mouseX > 400 && mouseX < 515 && mouseY > 450 && mouseY < 580){
      level = 4; // Goes to level 4 if level 4 is pressed
    } else if (mouseX > 650 && mouseX < 765 && mouseY > 450 && mouseY < 580){
      level = 5; // Goes to level 5 if level 5 is pressed
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
