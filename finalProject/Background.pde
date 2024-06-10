class Background{
  Board current;
  Timer timeSinceStarted;
  
  Background(Board board){
    current = board;
    timeSinceStarted = new Timer();
  }
  Boolean onMenu = true;
  Boolean sprint = false;
  Boolean blitz = false;
  Boolean zen = false;
  
  void displayMenu(){
      textAlign(LEFT, LEFT);
      background(0, 0, 0);
      fill(255, 255, 255);
      textSize(125);
      text("tetris", 50, 125);
      strokeWeight(5);
      stroke(255, 255, 255);
      fill(250, 245, 70);
      rect(350, 200, 625, 100);
      fill(255, 100, 0);
      rect(350, 350, 625, 100);
      fill(100, 50, 150);
      rect(350, 500, 625, 100);
      hovering();
      textSize(55);
      fill(255, 255, 255);
      text("sprint", 588, 270);
      text("blitz", 603, 420);
      text("zen", 630, 570);
      strokeWeight(1);
  }
  
  void hovering() {
  if (tetris.currentBackground.onMenu) {
    if (mouseX > 350 && mouseX < 975 && mouseY > 200 && mouseY < 300) {
      fill(255, 230, 44);
      rect(350, 200, 625, 100);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 350 && mouseY < 450) {
      fill(220, 80, 0);
      rect(350, 350, 625, 100);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 500 && mouseY < 600) {
      fill(90, 40, 140);
      rect(350, 500, 625, 100);
    }
   }
  }
  
  void displayBoard(){
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 24; j++) {
        if(j < 4) {
          if(displayColor(current.board[23-j][i]) == color(0, 0, 0)) {
            fill(displayColor(current.board[23-j][i]));
            noStroke();
            square(25*i+375, 25*j, 25);
          }
          else {
            fill(displayColor(current.board[23-j][i]));
            stroke(255, 255, 255);
            square(25*i+375, 25*j, 25);
          }
        }
        else {
          fill(displayColor(current.board[23-j][i]));
          stroke(255, 255, 255);
          square(25*i+375, 25*j, 25);
        }
      }
    }
    noFill();
  }
  
  void displayPiece() {
    for (int i = 0; i < 4; i++) {
      int yCoord = 23 - (current.currentPiece.shape[i][0]+current.currentPiece.pivotCoords[0]);
      int xCoord = current.currentPiece.shape[i][1]+current.currentPiece.pivotCoords[1];
      fill(displayColor(current.currentPiece.pieceType));
      stroke(255, 255, 255);
      square(25*xCoord + 375, 25*yCoord, 25);
    }
    noFill();
  }
  
  void displayGhost() {
    for (int i = 0; i < 4; i++) {
      int yCoord = 23 - (current.ghostPiece.shape[i][0]+current.ghostPiece.pivotCoords[0]);
      int xCoord = current.ghostPiece.shape[i][1]+current.ghostPiece.pivotCoords[1];
      fill(105, 105, 105);
      stroke(255, 255, 255);
      square(25*xCoord + 375, 25*yCoord, 25);
    }
    noFill();
  }
  
  color displayColor(char c){
    if (c == 't') {
      return color(128, 0, 128);
    }
    if (c == 's') {
      return color(0, 255, 0);
    }
    if (c == 'z') {
      return color(255, 0, 0);
    }
    if (c == 'l') {
      return color(255, 127, 0);
    }
    if (c == 'j') {
      return color(0, 0, 255);
    }
    if (c == 'o') {
      return color(255, 255, 0);
    }
    if (c == 'i') {
      return color(0, 255, 255);
    }
    return color(0, 0, 0);
  }
  
  void displayScore(){
    textAlign(LEFT);
    fill(255, 255, 255);
    textSize(20);
    text("Score", 632, 530);
    fill(0, 0, 0);
    noStroke();
    rect(632, 540, 67, 40);
    fill(255, 255, 255);
    textSize(25);
    text(current.score, 632, 560);
  }
  
  void displayTimer(){
    textAlign(LEFT, LEFT);
    if (sprint || blitz) {
      int seconds;
      if(sprint){
        seconds = timeSinceStarted.getTime() / 1000;
      }else{
        seconds = 120 - timeSinceStarted.getTime() / 1000;
      }
      int minutes = seconds / 60;
      String time = "";
      if (minutes < 10) {
        time = time + "0" + minutes;
      }
      else {
        time = time + minutes;
      }
      time = time + ":";
      if (seconds % 60 < 10) {
        time = time + "0" + seconds % 60;
      }
      else if (seconds > 59){
        time = time + seconds % 60;
      }
      else {
        time = time + seconds;
      }
      fill(255, 255, 255);
      textSize(20);
      text("Time", 325, 520);
      fill(0, 0, 0);
      noStroke();
      rect(303, 525, 67, 40);
      fill(255, 255, 255);
      textSize(25);
      text(time, 305, 550);
    }
  }

  void displayQueue(){
    textAlign(LEFT, LEFT);
    fill(0, 0, 0);
    stroke(255, 255, 255);
    rect(625, 100, 75, 400);
    textSize(25);
    fill(255,255,255);
    text("queue", 634, 125);
    for (int i = 0; i < 5; i++) {
      fill(displayColor(current.pieceQueue[i].pieceType));
      drawPiece(656.5, 72.5*i+160, current.pieceQueue[i].pieceType);
    }
    noFill();
  }
  
  void drawPiece(float x, float y, char piece){
    if(piece == 't'){
      square(x-15, y+7.5, 15);
      square(x, y+7.5, 15);
      square(x+15, y+7.5, 15);
      square(x, y-7.5, 15);
    }
    if(piece == 'o'){
      square(x-7.5, y-7.5, 15);
      square(x-7.5, y+7.5, 15);
      square(x+7.5, y-7.5, 15);
      square(x+7.5, y+7.5, 15);
    }
    if(piece == 'l'){
      square(x-15, y+7.5, 15);
      square(x, y+7.5, 15);
      square(x+15, y+7.5, 15);
      square(x+15, y-7.5, 15);
    }
    if(piece == 'j'){
      square(x-15, y+7.5, 15);
      square(x, y+7.5, 15);
      square(x+15, y+7.5, 15);
      square(x-15, y-7.5, 15);
    }
    if(piece == 's'){
      square(x, y+7.5, 15);
      square(x, y-7.5, 15);
      square(x-15, y+7.5, 15);
      square(x+15, y-7.5, 15);
    }
    if(piece == 'z'){
      square(x, y+7.5, 15);
      square(x, y-7.5, 15);
      square(x+15, y+7.5, 15);
      square(x-15, y-7.5, 15);
    }
    if(piece == 'i'){
      square(x-22.5, y, 15);
      square(x-7.5, y, 15);
      square(x+7.5, y, 15);
      square(x+22.5, y, 15);
    }
  }
  
  void displayHold(){
    textAlign(LEFT, LEFT);
    fill(0, 0, 0);
    stroke(255, 255, 255);
    rect(275, 100, 100, 100);
    textSize(25);
    fill(255,255,255);
    text("hold", 303, 125);
    if (current.heldPiece != null) {
      fill(displayColor(current.heldPiece.pieceType));
      drawPiece(317.5, 150, current.heldPiece.pieceType);
    }
    noFill();
  }
  
  void displayWin(){
    textAlign(CENTER, CENTER);
    textSize(200);
    fill(255, 255, 255);
    text("nice!", 500, 220);
    textSize(100);
    if (sprint) {
      int seconds = timeSinceStarted.getTime() / 1000;
      int minutes = seconds / 60;
      String time = "";
      if (minutes < 10) {
        time = time + "0" + minutes;
      }
      else {
        time = time + minutes;
      }
      time = time + ":";
      if (seconds % 60 < 10) {
        time = time + "0" + seconds % 60;
      }
      else if (seconds > 59){
        time = time + seconds % 60;
      }
      else {
        time = time + seconds;
      }
      String str = "time taken: " + time;
      text(str, 500, 410);
    }
    if (blitz) {
      String str = "score: " + current.score;
      text(str, 500, 410);
    }
    stroke(255, 255, 255);
    fill(0, 0, 0);
    rect(510, 500, 380, 100);
    fill(255, 255, 255);
    textSize(75);
    text("restart?", 707, 550);
    stroke(255, 255, 255);
    fill(0, 0, 0);
    rect(110, 500, 380, 100);
    fill(255, 255, 255);
    textSize(75);
    text("menu", 303, 550);
  }
  
  void displayDefeat(){
    textSize(200);
    textAlign(CENTER, CENTER);
    text("defeat", 500, 275);
    stroke(255, 255, 255);
    fill(0, 0, 0);
    rect(510, 500, 380, 100);
    fill(255, 255, 255);
    textSize(75);
    text("restart?", 707, 550);
    stroke(255, 255, 255);
    fill(0, 0, 0);
    rect(110, 500, 380, 100);
    fill(255, 255, 255);
    textSize(75);
    text("menu", 303, 550);
  }
  
  void displayLines(){
    textAlign(LEFT, LEFT);
    textSize(20);
    text("Lines Left", 278, 250);
    fill(0, 0, 0);
    rect(310, 260, 30, 30);
    fill(255, 255, 255);
    textSize(25);
    String str = "" + (40 - current.linesCleared);
    textAlign(CENTER, CENTER);
    text(str, 325, 270);
  }
}
