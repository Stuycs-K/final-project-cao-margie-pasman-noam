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
  
  void endGame(){
    
  }
  
  void frame(){
    currentBackground.makeBackground();
    currentBackground.displayBoard(currentBoard);
    currentBackground.displayPiece(currentBoard);
    currentBackground.displayScore(currentBoard);
    currentBackground.displayQueue(currentBoard);
    currentBackground.displayHold(currentBoard);
    if(currentBoard.gameEnd){
      endGame();
    }
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
    currentBoard.currentPiece.spin(1);
  }
  void ccwSpin(){
    currentBoard.currentPiece.spin(3);
  }
  void halfSpin(){
    currentBoard.currentPiece.spin(2);
  }
  void hardDrop(){
    currentBoard.currentPiece.hardDrop();
  }
  void hold(){
    currentBoard.hold();
  }
}
