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
  
  void mode(String str) {
    frame();
    if (str.equals("sprint")) {
      currentBackground.displayTimer();
    }
    if (str.equals("blitz")) {
      currentBackground.displayTimer();
      currentBackground.displayScore();
    }
    if (str.equals("zen")) {
      currentBackground.displayScore();
    }
  }
  
  void frame(){
    currentBackground.displayBoard();
    currentBackground.displayPiece();
    currentBackground.displayScore();
    currentBackground.displayQueue();
    currentBackground.displayHold();
    if(currentBoard.gameEnd){
      endGame();
    }
    currentBoard.timedDrop();
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
