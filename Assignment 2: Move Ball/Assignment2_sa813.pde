//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

int padWidth = 20, padHeight = 100; //paddle height and width

int ballX = 640, ballY = 360; //ball position
int ballWidth = 30, ballHeight = 30; //ball width and height

int padXleft = 0, padYleft = 0; // pad left position
int padXright = 1259, padYright = 619; //pad right position

int scoreXP1 = 450, scoreYP1 = 360; //left player score position
int scoreXP2 = 810, scoreYP2 = 360; //right player score position

int scoreText = 40; //score text size

int ballXspeed = 4, ballYspeed = 4; //ball speed

void setup() //runs once
{
  fullScreen(); //® the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (0,0,0); //colour black
  
  //draw and colour ball
  fill (0,255,0); // paddles green
  stroke (0,0,255); // paddles outline blue
  rect(padXleft, padYleft, padWidth, padHeight ); //Left paddle
  rect(padXright, padYright, padWidth, padHeight ); //Right paddle
  
  //draw and colour ball
  fill (255); //ball colour
  ellipse (ballX, ballY, ballWidth, ballHeight); //ellipse = circle, draw ball
  
  //Score text
  textSize(scoreText);
  text ("0", scoreXP1, scoreYP1); //left player
  text ("5", scoreXP2, scoreYP2); //right player
  
  //ball movement
  ballX = ballX + ballXspeed;
  ballY = ballY - ballYspeed;
}

