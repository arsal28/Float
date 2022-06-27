class Buttons {
  boolean play = true; // MENU PLAY BUTTON
  boolean help = true; // MENU HELP BUTTON

  void update() {

    if (play && help) {
      TITLE();
      PLAY(400, 250, 400, 100);
      HELP(400, 375, 400, 100);
    }
    if (!help) {
      background(255);
      image(img2, 0, 0);
      EXIT(1150, 5, 40, 40);
    }
  }

  void TITLE() {
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text("FLOAT", 600, 150);
  }
  
  void PLAY(float x, float y, float w, float h) { // PLAY BUTTON
    if (mouseX >= x && mouseX <= x + w  && mouseY >= y && mouseY <= y + h) {
      fill(60, 179, 113);
      stroke(255);
      rect(x, y, w, h);
      fill(255);
      textSize(90);
      text("PLAY", 600, 335);
    } else {
      fill(220, 220, 220);
      stroke(255);
      rect(x, y, w, h);
      fill(0);
      textSize(90);
      text("PLAY", 600, 335);
    }
    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h && mousePressed) {
      savedTime = millis();
      state = 3;
    }
  }

  void HELP(float x, float y, float w, float h) { // HELP BUTTON
    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h) {
      fill(60, 179, 113);
      rect(x, y, w, h);
      fill(255);
      textSize(90);
      text("HELP", 600, 455);
    } else {
      fill(220, 220, 220);
      rect(x, y, w, h);
      fill(0);
      textSize(90);
      text("HELP", 600, 455);
    }

    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h && mousePressed) {
      help = false;
    }
  }

  void EXIT(float x, float y, float w, float h) { // EXIT BUTTON
    fill(255, 0, 0);
    stroke(255);
    rect(x, y, h, w);
    fill(255);
    textSize(50);
    text("X", 1170, 42);
    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h && mousePressed) {
      passedTime = 0;
      play = true;
      help = true;
    }
  }

  void RETRY(float x, float y, float w, float h) { // RETRY BUTTON
    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h) {
      fill(60, 179, 113);
      rect(x, y, w, h);
      fill(255);
      textSize(90);
      text("RETRY", 600, 455);
    } else {
      fill(220, 220, 220);
      rect(x, y, w, h);
      fill(0);
      textSize(90);
      text("RETRY", 600, 455);
    }
    if (mouseX >= x && mouseX <= x+ w  && mouseY >= y && mouseY <= y+ h && mousePressed) {
      ob.display();
      plyr.display();
      plyr.update();
      state = 3;
    }
  }
}
