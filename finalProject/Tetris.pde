class Tetris{
  Board currentBoard;
  Background currentBackground;
  
  Tetris(){
    
  }
  
  void startGame(){
    currentBackground = new Background();    
    currentBoard = new Board();
  }
  
  void endGame(){
    
  }
  
  void mode(String str) {
    frame();
    if (str.equals("sprint")) {
      currentBackground.displayTimer(currentBoard);
    }
    if (str.equals("blitz")) {
      currentBackground.displayTimer(currentBoard);
      currentBackground.displayScore(currentBoard);
    }
    if (str.equals("zen")) {
      currentBackground.displayScore(currentBoard);
    }
  }
  
  void frame(){
    currentBackground.makeBackground();
    currentBackground.displayBoard(currentBoard);
    currentBackground.displayPiece(currentBoard);
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
