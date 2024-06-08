class Tetris{
  Board currentBoard;
  Background currentBackground;
  
  Tetris(){
    
  }
  
  void startGame(){
    currentBoard = new Board();
    currentBackground = new Background(currentBoard);
  }
  
  void endGame(){
    
  }
  
  void mode() {
    if (currentBackground.onMenu) {
      currentBackground.displayMenu();
    }
    else {
      frame();
      if (currentBackground.sprint == true) {
        currentBackground.displayTimer();
      }
      if (currentBackground.blitz == true) {
        currentBackground.displayTimer();
        currentBackground.displayScore();
      }
      if (currentBackground.zen == true) {
        currentBackground.displayScore();
      }
    }
  }
  
  void frame(){
    currentBackground.displayBoard();
    currentBackground.displayPiece();
    currentBackground.displayScore();
    currentBackground.displayQueue();
    currentBackground.displayHold();
    currentBoard.setPieceTouchingBoardTime();
    currentBoard.timedDrop();
    if(currentBoard.gameEnd){
      endGame();
    }
  }
  
  void moveDown(){
    if(currentBoard.currentPiece.tryToMove(new int[] {-1,0})){
      currentBoard.numMovesWhileTouching = 0;
    }
  }
  void moveLeft(){
    currentBoard.currentPiece.tryToMove(new int[] {0,-1});
    currentBoard.lockDelay();
  }
  void moveRight(){
    currentBoard.currentPiece.tryToMove(new int[] {0,1});
    currentBoard.lockDelay();
      
  }
  void cwSpin(){
    currentBoard.currentPiece.spin(1);
    currentBoard.lockDelay();
  }
  void ccwSpin(){
    currentBoard.currentPiece.spin(3);
    currentBoard.lockDelay();
  }
  void halfSpin(){
    currentBoard.currentPiece.spin(2);
    currentBoard.lockDelay();
  }
  void hardDrop(){
    currentBoard.currentPiece.hardDrop();
  }
  void hold(){
    currentBoard.hold();
  }
}
