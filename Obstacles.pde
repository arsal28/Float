class Obstacles {
  float ObsX, ObsY, ObsSpeed;

  Obstacles(float x, float y, float speed) { //OBSTACLE POSITONS
    ObsX = x;
    ObsY = y;
    ObsSpeed = speed;
  }

  void display() { // DISPLAY OBSTACLES
    fill(60, 179, 113);
    rect(ObsX, ObsY, 50, 230);
    ObsX-=ObsSpeed;

    if (ObsX < 0) { // OBSTACLE GENERATION
      ObsX = width;
      ObsY=random(height)-200/2;
    }
  }
}
