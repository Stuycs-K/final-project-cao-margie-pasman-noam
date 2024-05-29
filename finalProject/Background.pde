class Background{
  Background(){}
  
  void makeBackground(){
    
  }
  
  void displayBoard(Board current){
    rect(0, 0, 250, 500);
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 24; j++) {
        if(j < 4) {
          fill(displayColor(current.board[23-j][9-i]));
          noStroke();
          square(25*i, 25*j, 25);
        }
        else {
          fill(displayColor(current.board[23-j][9-i]));
          stroke(256, 256, 256);
          square(25*i, 25*j, 25);
        }
      }
    }
  }
  
  void displayPiece(Board current) {
  
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
  
  void displayScore(Board board){
    
  }
  
  void displayQueue(Board board){
    rect(250, 100, 75, 400);
    textSize(25);
    fill(256,256,256);
    text("queue", 255, 90);
    for (int i = 0; i < 5; i++) {
      fill(displayColor(board.pieceQueue[i].pieceType));
      drawPiece(281.5, 80*i+125, board.pieceQueue[i].pieceType);
    }
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
  
  void displayHold(Board board){
    
  }
  
}
