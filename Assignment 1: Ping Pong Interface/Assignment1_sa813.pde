//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

int padWidth = 20, padHeight = 100;

int scoreP1 = 0, scoreP2 = 0; //initialize score


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
  rect(0, 0, padWidth, padHeight ); //Left paddle
  rect(1260, 620, padWidth, padHeight ); //Right paddle
  
  //draw and colour ball
  fill (255); //ball colour
  stroke (150); //ball outline colour
  ellipse (screenWidth/2, screenHeight/2, 30, 30); //ellipse = circle, draw ball
  
  //Score text
  textSize(40);
  text (scoreP1, 450, 360); //left player
  text (scoreP2, 810, 360); //right player
  
}
