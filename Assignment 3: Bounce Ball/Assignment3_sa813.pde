//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

int padWidth = 20, padHeight = 100; //paddle height and width

int ballX = 640, ballY = 360; //ball position
int ballWidth = 30, ballHeight = 30; //ball width and height

int padXleft = 0, padYleft = 0; //pad left position
int padXright = 1259, padYright = 619; //pad right position

int scoreXP1 = 450, scoreYP1 = 360; //left player score position
int scoreXP2 = 810, scoreYP2 = 360; //right player score position

int scoreText = 40; //score text size

int ballXspeed = 4, ballYspeed = 4; //ball speed

boolean gameOn; //start game

int scoreP1 = 0, scoreP2 = 0; //initialize score

int radius = 15; //half of the ball
void setup() //runs once
{
  fullScreen(); //® the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (0,0,0); //colour black
  
  //draw and colour ball
  fill (0,255,0); //paddles green
  stroke (0,0,255); //paddles outline blue
  rect(padXleft, padYleft, padWidth, padHeight ); //Left paddle
  rect(padXright, padYright, padWidth, padHeight ); //Right paddle
  
  //draw and colour ball
  fill (255); //ball colour
  ellipse (ballX, ballY, ballWidth, ballHeight); //ellipse = circle, draw ball
  
  //Score text
  textSize(scoreText);
  text (scoreP1, scoreXP1, scoreYP1); //left player
  text (scoreP2, scoreXP2, scoreYP2); //right player
  
  //ball movement
  if (gameOn)
  {
    ballX = ballX + ballXspeed;
    ballY = ballY - ballYspeed;
  }
  
  //hits the top or bottom screen
  if ((ballY - radius) <= 0 || (ballY + radius) >= screenHeight )
  {
    ballYspeed = ballYspeed * -1; //reverse ball direction
  }
      
  //Set game to on
  if (mousePressed) //if screen touched
  {
    gameOn = true;
  } 
     
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
  
  
  
}

