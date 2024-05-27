class Tetris{
  Board currentBoard;
  Background currentBackground;
  
  Tetris(){
    
  }
  
  void startGame(){
    currentBackground = new Background();
    currentBackground.makeBackground();
    
    currentBoard = new Board();
  }
  
  void frame(){
    currentBackground.makeBackground();
    currentBackground.displayBoard(currentBoard);
    currentBackground.displayScore(currentBoard);
    currentBackground.displayQueue(currentBoard);
    currentBackground.displayHold(currentBoard);
  }
}
