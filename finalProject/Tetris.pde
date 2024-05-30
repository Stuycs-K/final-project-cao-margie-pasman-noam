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
    currentBackground.displayPiece(currentBoard);
    currentBackground.displayScore(currentBoard);
    currentBackground.displayQueue(currentBoard);
    currentBackground.displayHold(currentBoard);
  }
  
  void moveDown(){
    currentBoard.currentPiece.tryToMove(new int[] {-1,0});
  }
  void moveLeft(){
    currentBoard.currentPiece.tryToMove(new int[] {0,-1});
  }
  void moveRight(){
    currentBoard.currentPiece.tryToMove(new int[] {0,1});
  }
  void cwSpin(){
    
  }
  void ccwSpin(){
    
  }
  void halfSpin(){
    
  }
  void hardDrop(){
    currentBoard.currentPiece.hardDrop();
  }
  void hold(){
    currentBoard.hold();
  }
}
