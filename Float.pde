// MAIN FILE

Buttons b;
Player plyr;
Obstacles ob;
PImage img;
PImage img2;
int savedTime;
int passedTime;

HighScore saveScore = new HighScore();
int highscore = 0;

boolean[] keys = new boolean[2]; //CONTROLS
int state = 1; //GAME SCREEN

void setup() {
  background(255);
  size(1200, 700);
  //frameRate(100);
  plyr = new Player(300, 300);
  b = new Buttons();
  ob = new Obstacles(width, 0, 20);
  img = loadImage("flappy (1).png");
  img2 = loadImage("W - UP S - DOWN.png");
  
  highscore = saveScore.read(); 
}

void draw() {
  background(255);
  image(img, 0, 0);
  if (state == 1) {
    b.update();
  }

  if (state == 3) { // WHEN PLAYER PRESSES RETRY
    passedTime = millis() - savedTime;
    textSize(50);
    fill(255);
    text("Score: " + ((int) (passedTime/920.0f)), 100, 50);
    ob.display();
    plyr.display();
    plyr.update();
    if (plyr.collision(plyr.xPos, plyr.yPos, 25, ob.ObsX, ob.ObsY, 50, 200)) {
      state = 2;
      
      //GAME END
      int newScore = ((int) (passedTime/920.0f));
      if (newScore > highscore) {
        highscore = newScore;
        saveScore.write(highscore);
      }
      
    }
  }


  if (state == 2) { //GAME OVER SCREEN
    textSize(60);
    textAlign(CENTER);
    fill(244);
    savedTime = millis();
    text("GAME OVER", width/2, height/2-200);
    textSize(50);
    text("Final score: " + ((int) (passedTime/920.0f)), width/2, height/2-105);
    text("High score: " + highscore, width/2, height/2-30);
    b.RETRY(400, 375, 400, 100);
  }
}

void keyPressed() { // IF PLAYER PRESSES
  if (key == 's') {
    keys[0] = true;
  }
  if (key == 'w') {
    keys[1] = true;
  }
}

void keyReleased() { // IF PLAYER RELEASES
  if (key == 's') {
    keys[0] = false;
  }
  if (key == 'w') {
    keys[1] = false;
  }
}
