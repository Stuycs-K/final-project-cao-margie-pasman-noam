class Background{
  Background(){}
  
  void makeBackground(){
    
  }
  
  void displayBoard(Board current){
    rect(0, 0, 250, 500);
    for (int i = 0; i < current.board.length; i++) {
      for (int j = 0; j < current.board[i].length; j++) {
        if(j < 4) {
          fill(displayColor(current.board[i][j]));
          square(25*i, 25*j, 25);
        }
        fill(displayColor(current.board[i][j]));
        stroke(256, 256, 256);
        square(25*i, 25*j, 25);
      }
    }
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
    rect(250, 0, 75, 400);
    for (int i = 0; i < 5; i++) {
      //board.pieceQueue[i];
    }
  }
  
  void displayHold(Board board){
    
  }
  
}
