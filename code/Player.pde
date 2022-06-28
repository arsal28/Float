class Player {
  float xPos, yPos, yVel;
  float gravity = 1;

  Player(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void display() { // DISPLAY PLAYER
    fill(255, 0, 0);
    //ellipseMode(CENTER);
    ellipse(xPos, yPos, 50, 50);
  }


  void update() { // PLAYER CONTROLS
    if (keys[1]) {   // ' ' MOVE UP
      yVel = -7;
    }

    if (keys[0]) {   // 'A' MOVE DOWN
      yVel = 7;
    }

    if (!(keys[0] || keys[1])) {
      yVel = 0;
    }

    yPos = yVel + yPos + gravity;

    if (yPos > 700-50/2) {
      yPos = 700-50/2;
    }

    if (yPos < 50/2) {
      yPos = 50/2;
    }
  }

  boolean collision(float cx, float cy, float radius, float rx, float ry, float rw, float rh) { // COLLISION DETECTION

    float testX = cx;
    float testY = cy;

    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= radius) {
      return true;
    } else {
      return false;
    }
  }
}
