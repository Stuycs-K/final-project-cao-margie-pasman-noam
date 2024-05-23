class Background{
  void background(){
    
  }
  
  void displayBoard(Board board){
    for (char[] line : board) {
      for (char piece : line) {
        fill(displayColor(piece));
        square(200, 200, 200);
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
