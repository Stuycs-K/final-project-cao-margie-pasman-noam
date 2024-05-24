class Tetris{
  Board currentBoard;
  Background currentBackground;
  
  Tetris(){
    currentBoard = new Board();
    currentBackground = new Background();
  }
  
  void startGame(){
    currentBackground.makeBackground();
  }
  
  void end(){
    currentBackground.makeBackground();
  }
  
  void restart(){
    
  }
}
