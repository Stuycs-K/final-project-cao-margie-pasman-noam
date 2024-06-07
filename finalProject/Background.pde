class Background{
  Board current;
  Background(Board board){
    current = board;
  }
  Boolean onMenu = true;
  Boolean sprint = false;
  Boolean blitz = false;
  Boolean zen = false;
  
  void displayMenu(){
      background(0, 0, 0);
      fill(255, 255, 255);
      textSize(125);
      text("tetris", 50, 125);
      stroke(256, 256, 256);
      fill(255, 255, 0);
      rect(350, 200, 625, 100);
      fill(255, 100, 0);
      rect(350, 350, 625, 100);
      fill(100, 50, 150);
      rect(350, 500, 625, 100);
  }
  
  void displayBoard(){
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 24; j++) {
        if(j < 4) {
          if(displayColor(current.board[23-j][i]) == color(0, 0, 0)) {
            fill(displayColor(current.board[23-j][i]));
            noStroke();
            square(25*i+100, 25*j, 25);
          }
          else {
            fill(displayColor(current.board[23-j][i]));
            stroke(256, 256, 256);
            square(25*i+100, 25*j, 25);
          }
        }
        else {
          fill(displayColor(current.board[23-j][i]));
          stroke(256, 256, 256);
          square(25*i+100, 25*j, 25);
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
      stroke(256, 256, 256);
      square(25*xCoord + 100, 25*yCoord, 25);
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
    
  }
  
  void displayTimer(){
  
  }

  void displayQueue(){
    fill(0, 0, 0);
    stroke(256, 256, 256);
    rect(350, 100, 75, 400);
    textSize(25);
    fill(256,256,256);
    text("queue", 355, 125);
    for (int i = 0; i < 5; i++) {
      fill(displayColor(current.pieceQueue[i].pieceType));
      drawPiece(381.5, 72.5*i+155, current.pieceQueue[i].pieceType);
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
    fill(0, 0, 0);
    stroke(256, 256, 256);
    rect(0, 100, 100, 100);
    textSize(27.5);
    fill(256,256,256);
    text("hold", 25, 125);
    if (current.heldPiece != null) {
      fill(displayColor(current.heldPiece.pieceType));
      drawPiece(42.5, 150, current.heldPiece.pieceType);
    }
    noFill();
  }
  
}
