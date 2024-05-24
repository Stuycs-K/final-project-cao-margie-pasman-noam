class Background{
  Background(){}
  
  void makeBackground(){
    
  }
  
  void displayBoard(Board current){
    rect(0, 0, 500, 1000);
    for (int i = 0; i < current.board.length; i++) {
      for (int j = 0; j < current.board[i].length; j++) {
        fill(displayColor(current.board[i][j]));
        square(0, 0, 50);
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
    
  }
  
  void displayHold(Board board){
    
  }
  
}
