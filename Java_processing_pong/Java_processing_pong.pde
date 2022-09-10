Ball ball; // define the ball as a global object
Paddle paddleLeft;
Paddle paddleRight;
int scoreLeft = 0;
int scoreRight = 0;


void setup() {
  size(800, 600);
  ball = new Ball(width/2, height/2, 50); //create a new ball to the center of the window
  ball.speedX = 5; //giving the ball speed in x-axis
  ball.speedY = random(-3, 3); // giving the ball speed in y-axis
  paddleLeft = new Paddle(15, height/2, 30, 200);
  paddleRight = new Paddle(width-15, height/2, 30, 200);
}

void keyPressed() {
  if (keyCode == UP) {
    paddleRight.speedY=-3;
  }
  if (keyCode == DOWN) {
    paddleRight.speedY=3;
  }
  if (key == 'w') {
    paddleLeft.speedY=-3;
  }
  if (key == 's') {
    paddleLeft.speedY=3;
  }
}

void keyReleased() {
  if (keyCode == UP && paddleRight.speedY<0) {
    paddleRight.speedY=0;
  }
  if (keyCode == DOWN && paddleRight.speedY>0) {
    paddleRight.speedY=0;
  }
  if (key == 'w') {
    paddleLeft.speedY=0;
  }
  if (key == 's') {
    paddleLeft.speedY=0;
  }
}

void draw() {
  background(0); // clear the window
  ball.move(); //calculate a new location for the ball
  ball.display(); //draw the ball to the window

  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

  if (ball.right() > width) { //if stuff between () is true, execute code between {}
    scoreLeft = scoreLeft +1;
    ball.x = width/2;
    ball.y = height/2;
   
  }

  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }

  //If the ball gets behind the paddle
  //AND if the ball is in the area of the paddle (between paddle top and bottom)
  //bounce the ball to other direction

  if (ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()) {
    ball.speedX = -ball.speedX;
  }

  if (ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
  }
 
  textSize(40);
  textAlign(CENTER);
 
  text(scoreRight, width/2+30, 30); // right side score
  text(scoreLeft, width/2-30, 30); // left side score


}

class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;

  // constructor method
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225);
  }

  void move () {
    // add speed to location
    y = y + speedY;
    x = x + speedX;
  }

  void display() {
    fill(c); // set the drawing colour
    ellipse(x, y, diameter, diameter); // draw a circle
  }

  //functions to help with collision detection
  float left() {
    return x-diameter/2;
  }
  float right() {
    return x+diameter/2;
  }
  float top() {
    return y-diameter/2;
  }
  float bottom() {
    return y+diameter/2;
  }
}

class Paddle {

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;

  Paddle(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y= tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c = (255);
  }

  void move() {
    y += speedY;
    x += speedX;
  }

  void display () {
    fill(c);
    rect(x-w/2, y-h/2, w, h);
  }

  //helper functions
  float left() {
    return x-w/2;
  }

  float right() {
    return x+w/2;
  }

  float top() {
    return y-h/2;
  }

  float bottom () {
    return y+h/2;
  }
}
