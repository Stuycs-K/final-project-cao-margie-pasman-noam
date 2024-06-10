class Tetris{
  Board currentBoard;
  Background currentBackground;
  
  final int DAS = 10;
  final int ARR = 3;
  final int SDF = 4;
  
  boolean pressedDown;
  int downCounter;
  
  boolean pressedLeft;
  int leftCounter;
  
  boolean pressedRight;
  int rightCounter;
  
  String lastMode;
  
  Tetris(){
    pressedDown = false;
    pressedLeft = false;
    pressedRight = false;
  }
  
  void startGame(){
    currentBoard = new Board();
    currentBackground = new Background(currentBoard);
  }
  
  void mode() {
    if (currentBackground.onMenu) {
      currentBackground.displayMenu();
    }
    else {
      if (!currentBoard.gameEnd) {
        frame();
        if (currentBackground.sprint) {
          currentBackground.displayTimer();
        }
        if (currentBackground.blitz) {
          currentBackground.displayTimer();
          currentBackground.displayScore();
        }
      }
    }
  }
  
  void frame(){
    currentBackground.displayBoard();
    currentBackground.displayGhost();
    currentBackground.displayPiece();
    currentBackground.displayQueue();
    currentBackground.displayHold();
    currentBackground.timeSinceStarted.updateTime();
    
    currentBackground.displayInstructions();
    currentBoard.setPieceTouchingBoardTime();
    
    if(pressedDown){
      if(downCounter % SDF == 0){
        moveDown();
      }
      downCounter++;
    }
    if(pressedLeft){
      if(leftCounter == 0 || leftCounter > DAS && leftCounter % ARR == 0){
        moveLeft();
      }
      leftCounter++;
    }
    if(pressedRight){
      if(rightCounter == 0 || rightCounter > DAS && rightCounter % ARR == 0){
        moveRight();
      }
      rightCounter++;
    }
    
    currentBoard.timedDrop();
    if(currentBackground.sprint && currentBoard.linesCleared >= 10){
      background(0, 0, 0);
      lastMode = "sprint";
      currentBackground.displayWin();
      currentBackground.sprint = false;
      currentBoard.gameEnd = true;
    }
    else if(currentBackground.blitz && currentBackground.timeSinceStarted.getTime() > 120000){
      background(0, 0, 0);
      lastMode = "blitz";
      currentBackground.displayWin();
      currentBackground.blitz = false;
      currentBoard.gameEnd = true;
    }
    else if(currentBoard.gameEnd){
      currentBackground.displayDefeat();
    }
  }
  
  void moveDown(){
    if(currentBoard.currentPiece.tryToMove(new int[] {-1,0})){
      currentBoard.score++;
      currentBoard.updateGhostPiece();
      currentBoard.resetLockDelayVars();
    }
  }
  void moveLeft(){
    currentBoard.currentPiece.tryToMove(new int[] {0,-1});
    currentBoard.updateGhostPiece();
    currentBoard.lockDelay();
  }
  void moveRight(){
    currentBoard.currentPiece.tryToMove(new int[] {0,1});
    currentBoard.updateGhostPiece();
    currentBoard.lockDelay();
      
  }
  void cwSpin(){
    currentBoard.currentPiece.spin(1);
    currentBoard.updateGhostPiece();
    currentBoard.lockDelay();
  }
  void ccwSpin(){
    currentBoard.currentPiece.spin(3);
    currentBoard.updateGhostPiece();
    currentBoard.lockDelay();
  }
  void halfSpin(){
    currentBoard.currentPiece.spin(2);
    currentBoard.updateGhostPiece();
    currentBoard.lockDelay();
  }
  void hardDrop(){
    currentBoard.currentPiece.hardDrop(false);
  }
  void hold(){
    currentBoard.hold();
  }
}
