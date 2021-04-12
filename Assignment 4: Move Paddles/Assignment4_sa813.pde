//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

int padWidth = 20, padHeight = 100; //paddle height and width

int ballX = 640, ballY = 360; //ball position
int ballWidth = 30, ballHeight = 30; //ball width and height

float padXleft = 0, padYleft = 0; //pad left position
float padXright = 1259, padYright = 619; //pad right position

int scoreXP1 = 450, scoreYP1 = 360; //left player score position
int scoreXP2 = 810, scoreYP2 = 360; //right player score position

int scoreText = 40; //score text size

int ballXspeed = 6, ballYspeed = 6; //ball speed

boolean gameOn; //start game

int scoreP1 = 0, scoreP2 = 0; //initialize score

int radius = 15; //half of the ball

boolean  hasOverlappedLeftPad = false, hasOverlappedRightPad = false;

void setup() //runs once
{
  fullScreen(); //® the program to run in full screen mode
}

void draw() //runs forever
{
  background (0,0,0); //colour black
  fill (255);
  
  //call the following functions
  movePaddle(); 
  checkLeftPaddle();
  checkRightPaddle();
  displayScores(); // display player 1 & 2 score
  displayBall();
  displayPaddles(); // displays the left and right paddle
  moveBall();
  checkWall();
  setGameMode();

}

//function to move left and right paddle
void movePaddle()
{
  if (mouseX < screenWidth/2) // if the ball is on player one's side
  {
     padYleft = constrain(mouseY, padXleft, screenHeight - padHeight ); //move left paddle
  }
  else
  {
     padYright = constrain(mouseY, padXleft, screenHeight - padHeight ); //move right paddle
  }
}
  
//check overlap
Boolean doesOverlap( float xPad, float yPad, float widthPad, float heightPad, float xBall, float yBall, float radius)
{
  //ball
  float bleftEdge = xBall - radius; // left edge
  float bbottomEdge = yBall + radius; // bottom edge
  float brightEdge = xBall + radius; // right edge
  float btopEdge = yBall - radius; // top edge
  // paddle
  float padleftEdge = xPad; // left edge
  float padbottomEdge = yPad + heightPad; //bottom edge
  float padrightEdge = xPad + widthPad; // right edge
  float padtopEdge = yPad; //top edge
      
  if ((bbottomEdge >= padtopEdge) && (btopEdge <= padbottomEdge) && (brightEdge >= padleftEdge) && (bleftEdge <= padrightEdge)) // check if both the paddle & ball overlaps
    {
      return true;
    }
    else
    {
      return false;
    } 
}

//function to check overlap between ball and left paddle
void checkLeftPaddle()
{
  
  hasOverlappedLeftPad = doesOverlap(padXleft, padYleft, padWidth, padHeight, ballX ,ballY, radius);
  if (hasOverlappedLeftPad)
  {
    ballXspeed = ballXspeed * -1; //reverse the direction
  }
}
  
//function to check overlap between ball and right paddle
void checkRightPaddle()
{
  hasOverlappedRightPad = doesOverlap(padXright, padYright, padWidth, padHeight, ballX ,ballY, radius);
  if (hasOverlappedRightPad)
  {
    ballXspeed = ballXspeed * -1; //reverse the direction
  }
}
 
//function to display both player scores
void displayScores()
{
  //Score text
  textSize(scoreText);
  text (scoreP1, scoreXP1, scoreYP1); //left player
  text (scoreP2, scoreXP2, scoreYP2); //right player
}
  
//function draw and display ball
void displayBall()
{
  fill (255); //ball colour
  ellipse (ballX, ballY, ballWidth, ballHeight); //ellipse = circle, draw ball
}

//function to draw and display paddles
void displayPaddles()
{
  //draw and colour ball
  fill (0,255,0); //paddles green
  stroke (0,0,255); //paddles outline blue
  rect(padXleft, padYleft, padWidth, padHeight ); //Left paddle
  rect(padXright, padYright, padWidth, padHeight ); //Right paddle
}

//function for ball movement
void moveBall()
{
  if (gameOn)
  {
    //increase ball x & y positions
    ballX = ballX + ballXspeed;
    ballY = ballY - ballYspeed;
  }
}

//function to check if the ball hits walls
void checkWall()
{
  //hits the left walls
  if ((ballX + radius) < 0)
  {
    gameOn = false;
    scoreP1 = scoreP1 + 1; //increase score by 1
    //move ball to center  
    ballX = 640;
    ballY = 360;
  }
  //hits the right walls
  else if ((ballX + radius) > screenWidth)
  {
    gameOn = false;
    scoreP2 = scoreP2 + 1; //increase player 2 score
    //move ball to center
    ballX = 640;
    ballY = 360;
  }
  
  //hits the top or bottom screen
  if ((ballY - radius) <= 0 || (ballY + radius) >= screenHeight )
  {
    ballYspeed = ballYspeed * -1; //reverse ball direction
  }
}

//function that starts game  
boolean setGameMode()
{
  //Set game to on
  if (mousePressed) //if screen touched
  {
    gameOn = true; //starts game
  } 
    return gameOn;
}
  
  
  


