/*
Names - Daksh, Simarjit
Due Date - January 16, 2024
File Name - dakshGulatiSimarjitDusanjhSummative / Arcade
Purpose - The purpose of this program allows the user to select a game and play it for fun.
          These games include the Guessing game which is gambling with your score until the user loses,
          and the nim game which is 2 players, this allows the user to play with a friend and try to be the
          player that does not take the last stone out of the pile.
*/

// Imports the random and scanner classes
import java.util.Scanner;
import java.util.Random;

public class Arcade 
{
  public static void main(String[] args)
  {
  new Arcade();
  }
  public Arcade()
  {
    // Creates the Scanner Object
    Scanner myObj = new Scanner(System.in);
    Scanner myObj2 = new Scanner(System.in);
    Random random = new Random();
    
    // Welcomes the user to the arcade
    System.out.println("Welcome to the Arcade!");
    
    // choice starts at 0 to start the game
    int choice = 0; // Sets the choice amount to 0 to start the while loop to enter the main menu
    int games = 0; // Tracks the amount of games played
    
    while (choice == 0)
    {
    // Prompts the user to select a game
    System.out.println("Please select a game");
    System.out.println("1. Guessing Game");
    System.out.println("2. Nim Game");
    System.out.println("3. Exit");

    // Loop for invalid inputs
    while (!myObj.hasNextInt()) 
    {
    myObj.next(); // Consume the invalid input
    System.out.println("Invalid choice. Please enter a number between 1 and 3.");
    }
    
    // Puts the integer chosen into choice
    choice = myObj.nextInt ();
    
    // Selects the selected game by user or exits the program
    if (choice == 1)
    {
     System.out.println ("You have selected the Guessing Game / Gambling \n");
    }
    else if (choice == 2)
    {
      System.out.println ("You have selected the Nim Game \n");
    }
    else if (choice == 3)
    {
      System.out.println("Goodbye!");
    }
    else
    {
      System.out.println("Invalid choice, Exiting program");
    }

    // Variables for guessing game
    int score = 100; // Keeps the score
    int bet; // How many points the user bets
    int high = 1; // Variable to represent high
    int low = 2; // Variable to represent low
    
    int max = 6; // maximum value for the dice roll
    int min = 1; // minimum value for the dice roll
    
    
    
    // Guessing Game code
    while (choice == 1)
    {
      // Rules / Information
      System.out.println ("You have entered the Guessing Game also known as Gambling");
      System.out.println ("A 6 sided dice will be rolled and you have to guess if the dice will have a higher or lower number.");
      System.out.println ("A lower number represents numbers 1, 2 and 3");
      System.out.println ("A higher number represents numbers 4, 5 and 6\n");
      System.out.println ("The gambling part comes from your score, you bet a certain amount of score that is appliciable for you. the bet either be doubled or lost entirely depending on the guess.");
      System.out.println ("If a valid option is not chosen, the bet amount will decrease your score.");
      System.out.println ("Once the score reaches 0, it is Game Over! \n\n");
      
      do
      {
      // Selects a random number every time the user does their guess and either increases or decreases in bet
      int randomNumber = random.nextInt (max-min) + min;
        
      // Tells the user their current score
      System.out.println ("You have a current score of " + score + " which you will be able to bet");
      
      System.out.println ("How much do you want to bet?");
      
      // Loop for invalid inputs
      while (!myObj.hasNextInt())
      {
      System.out.println ("Invalid choice, please enter a valid number.");
      myObj.next (); // Consumes input
      }
      
      // Sets myObj to bet amount
      bet = myObj.nextInt ();
      
      // Reprompts the user to bet a different amount in their score if bet is not valid
      while (bet < 0 || bet > score)
        {
        System.out.println ("Invalid option. Please bet again!");
        bet = myObj.nextInt();
        
        while (!myObj.hasNextInt())
         {
         System.out.println ("Invalid choice, please enter a valid number.");
         myObj.next ();
         }
        }
      
      // Prompts user if the random number will be higher or lower
      System.out.println ("What do you think the random number on a 6 sided dice will be after rolled, higher or lower (type 1 for higher / 2 for lower)");
      
      // Loop for invalid inputs
      while (!myObj2.hasNextInt())
      {
      System.out.println ("Invalid option, choose 1 or 2.");
      myObj2.next (); // consumes input
      }
      
      int user1 = myObj2.nextInt();
      
      // Reprompts the user if they did not choose 1 or 2
      while (user1 != 1 && user1 != 2)
      {
      System.out.println ("Invalid option. Please choose higher (type 1) or lower (type 2)!");
      
      while (!myObj2.hasNextInt())
       {
       System.out.println ("Invalid option, choose 1 or 2.");
       myObj2.next ();
       }
      }
      
      // Empty string
      System.out.println (" ");
      
      // Invokes the highLow method
      highLow(user1, high, low, randomNumber);
      
      // Displays the random number from 1 - 6 to the user
      System.out.println ("The random number from 1 - 6 is " + randomNumber + ".\n");
      
      // Calculation for score   
      while (randomNumber == 1)
      {
      if (user1 == low)
       score = score + bet;
      else if (user1 == high)
       score = score - bet;
      else
       System.out.println ("You have not chosen the valid answer");
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
  
      // If the number is equal to 2
      while (randomNumber == 2)
      {
      if (user1 == low)
       score = score + bet;
      else if (user1 == high)
       score = score - bet;
      else
       System.out.println ("You have not chosen the valid answer");
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
  
      // If the number is equal to 3
      while (randomNumber == 3)
      {
      if (user1 == low)
       score = score + bet;
      else if (user1 == high)
       score = score - bet;
      else
       System.out.println ("You have not chosen the valid answer");
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
  
      // If the number is equal to 4
      while (randomNumber == 4)
      {
      if (user1 == low)
       score = score - bet;
      else if (user1 == high)
       score = score + bet;
      else
       System.out.println ("You have not chosen the valid answer");
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
  
      // If the number is equal to 5
      while (randomNumber == 5)
      {
      if (user1 == low)
       score = score - bet;
      else if (user1 == high)
       score = score + bet;
      else
       score = score - bet;
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
   
      // If the number is equal to 5
      while (randomNumber == 5)
      {
      if (user1 == low)
       score = score - bet;
      else if (user1 == high)
       score = score + bet;
      else
       System.out.println ("You have not chosen the valid answer");
      randomNumber = 7; // Changes the random number into 7 to prevent a loop
      }
      
      // Invokes the checkScore method
      checkScore (score, choice);
      }
      while (score != 0); // exits loop when score is equal 0 but continues if score are not equal to 0
      
      System.out.println ("\tGAME OVER!\n");
      
      System.out.println ("You have now played " + (games += 1) + " game(s)!\n"); // Adds a counter to how many games played
      
      choice = 0; // Sets the choice to 0 to go back to menu
      }
  
    
    
    // Variables for Nim Game
    int stones; // Represents amount of stones in the pile
    int player1; // 1st player to choose how many stones they would like to take out
    int player2; // 2nd player to choose how many stones they would like to take out
    
    // Nim Game code
    while (choice == 2)
    { 
    // Rules / Information
    System.out.println ("You have entered Nim Game!");
    System.out.println ("This is a 2 player game, the aim is to not pick up the last stone in the selected amount of stones chosen by you!");
    System.out.println ("Each user will have the choice of picking up 1, 2 or 3 stones until the pile is gone.");
    System.out.println ("If a player chose a invalid option, it will automatically get rid of 3 stones.");
    
    // Prompts user to choose how many stones will be played with
    System.out.println ("How many stones would you like to play with? (min - 10)");
    
    // Reprompts user if option is invalid
    while (!myObj.hasNextInt())
    {
    System.out.println ("Invalid option, choose another amount!");
    myObj.next();
    }
    
    // sets myObj value to stones
    stones = myObj.nextInt();
    
    // Reprompts the user if stones are less than 10
    while (stones < 10)
    {
    System.out.println ("Please choose a higher amount of stones to play with");
    
    // Reprompts user if option is invalid
    while (!myObj.hasNextInt())
     {
     System.out.println ("Invalid option, choose another amount!");
     myObj.next();
     }
    
    stones = myObj.nextInt();
    }
    
      // Prompts player 1 to choose how many stones they would like to take
      System.out.println ("Choose how many stones you would like to take out player 1 (1, 2 or 3)");
      
      // Loop for invalid inputs
      while (!myObj2.hasNextInt())
      {
      System.out.println ("Invalid option choose a different number");
      myObj2.next(); // consumes input
      }
      
      // Sets player1 to myObj2 if input is valid
      player1 = myObj2.nextInt();
     
      // If user enters a higher amount than 3, the amount of stones taken out of play will only result in 3
      while (player1 > 3 || player1 <= 0)
      {
      System.out.println ("Please enter a valid option");
      player1 = 3;
      }
      
      // Invokes the checkAmount1 method
      checkAmount1 (player1);
      
      // Calculation for player 1
      int value = stones - player1;
      
      System.out.println ("There are " + value + " stones left\n");
      
     do
     {
      // Prompts player 2 to choose how many stones they would like to take
      System.out.println ("Choose how many stones you would like to take out player 2 (1, 2 or 3)");
      
      // Reprompts user if option is invalid
      while (!myObj2.hasNextInt())
      {
      System.out.println ("Invalid option choose a different number");
      myObj2.next(); // Consumes input
      }
      
      // Sets player2 to myObj2 if input is valid
      player2 = myObj2.nextInt();
     
      // If user enters a higher amount than 3, the amount of stones taken out of play will only result in 3
      while (player2 > 3 || player2 <= 0)
      {
      System.out.println ("Please enter a valid option");
      player2 = 3; // Sets player2 to 3 if valid option was not chosen
      }
      
      // Calculates value
      value = value - player2;
      
      // Invokes the checkAmount2 method
      checkAmount2 (player2);
     
      System.out.println ("There are " + value + " stones left\n");
     
      // Invokes the checkLoss2 method
      checkLoss2 (value);
      
      // Sets value to 0 if the number has gone under 0 so the game is able to go back to menu
      if (value <= 0)
       {
       stones = 0;
       }
      else
       {
       System.out.println (" ");
       }
     
      // If player2 losses, code will exit loop
      if (stones == 0)
      {
      break;
      }
      
      // Prompts player 1 to choose how many stones they would like to take
      System.out.println ("Choose how many stones you would like to take out player 1 (1, 2 or 3)");
      
      // Loop for invalid inputs
      while (!myObj2.hasNextInt())
      {
      System.out.println ("Invalid option choose a different number");
      myObj2.next(); // consumes input
      }
      
      // Sets player1 to myObj2 if input is valid
      player1 = myObj2.nextInt();
     
      // If user enters a higher amount than 3, the amount of stones taken out of play will only result in 3
      while (player1 > 3 || player1 <= 0)
      {
      System.out.println ("Please enter a valid option");
      player1 = 3; // Sets player2 to 3 if valid option was not chosen
      }
      
      // Invokes the checkAmount1 method
      checkAmount1 (player1);
     
      // Calculation for value
      value = value - player1;
      
      // Calculation for person1
      System.out.println ("There are " + value + " stones left\n");
      
      // Invokes the checkLoss1 method
      checkLoss1 (value);
      
      // Sets value to 0 if the number has gone under 0 so the game is able to go back to menu
      if (value <= 0)
       {
       stones = 0;
       }
      else
       {
       System.out.println (" ");
       }
     }
     while (stones != 0); // exits loop when stones are equal 0 but continues if stones are not equal to 0
     
     System.out.println ("You have now played " + (games += 1) + " game(s)!\n"); // Adds a counter to how many games played
     
     choice = 0; // Sets the choice to 0 to go back to menu
     }
    }
 
 // Closes the Scanner Objects
 myObj.close();
 myObj2.close();
}
  
  // Methods for Guessing Game
  
  // checkScore method
  // Checks if their score is not equal to 0 otherwise game will go back to menu
  public int checkScore (int score2, int choice1)
  {
   if (score2 <= 0)
   {
   choice1 = 0;
   }
   else
   {
   System.out.println ("Continue to your next bet. \n");
   }
  return choice1;
  }

  // highLow Method
  public void highLow (int user, int high1, int low1, int num)
  {
  // If the number is equal to 1
  while (num == 1)
   {
   if (user == low1)
     System.out.println ("You have selected the correct option");
   else if (user == high1)
     System.out.println ("You have selected the incorrect option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
  }
  
  // If the number is equal to 2
  while (num == 2)
   {
   if (user == low1)
     System.out.println ("You have selected the correct option");
   else if (user == high1)
     System.out.println ("You have selected the incorrect option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
  }
  
  // If the number is equal to 3
  while (num == 3)
   {
   if (user == low1)
     System.out.println ("You have selected the correct option");
   else if (user == high1)
     System.out.println ("You have selected the incorrect option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
  }
  
  // If the number is equal to 4
  while (num == 4)
   {
   if (user == low1)
     System.out.println ("You have selected the incorrect option");
   else if (user == high1)
     System.out.println ("You have selected the correct option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
  }
  
   // If the nmber is equal to 5
   while (num == 5)
   {
   if (user == low1)
     System.out.println ("You have selected the incorrect option");
   else if (user == high1)
     System.out.println ("You have selected the correct option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
   }
   
   // If the number is equal to 6
   while (num == 6)
   {
   if (user == low1)
     System.out.println ("You have selected the incorrect option");
   else if (user == high1)
     System.out.println ("You have selected the correct option");
   else
     System.out.println ("You have not chosen the valid answer");
   num = 7;
   }
  }
  
  // Methods for nim game
  // checkAmount1 method
  public void checkAmount1 (int player11)
  {
   if (player11 == 1)
   {
   System.out.println ("1 stone will be removed\n");
   }
   else if (player11 == 2)
   {
   System.out.println ("2 stones will be removed\n");
   }
   else 
   {
   System.out.println ("3 stones will be removed\n");
   }
  }
  
  // checkAmount2 method
  public void checkAmount2 (int player22)
  {
  if (player22 == 1)
   {
   System.out.println ("1 stone will be removed\n");
   }
   else if (player22 == 2)
   {
   System.out.println ("2 stones will be removed\n");
   }
   else
   {
   System.out.println ("3 stones will be removed\n");
   }
  }
  
  // checkLoss1 method
  public void checkLoss1 (int value1)
  {
   if (value1 <= 0)
   {
   System.out.println ("Player 1 losses");
   }
   else
   {
   System.out.println ("Next player's turn!");
   }
  }
  
  // checkLoss2 method
  public void checkLoss2 (int value1)
  {
   if (value1 <= 0)
   {
   System.out.println ("Player 2 losses");
   }
   else
   {
   System.out.println ("Next player's turn!");
   }
  }
}