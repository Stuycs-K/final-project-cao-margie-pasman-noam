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
  
  boolean won = false;
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
          currentBackground.displayLines();
        }
        if (currentBackground.blitz) {
          currentBackground.displayTimer();
          currentBackground.displayScore();
        }
      }
    }
    if(currentBackground.sprint && currentBoard.linesCleared >= 10){
      background(0, 0, 0);
      lastMode = "sprint";
      currentBackground.displayWin();
      currentBackground.sprint = false;
      currentBoard.gameEnd = true;
      won = true;
    }
    else if(currentBackground.blitz && currentBackground.timeSinceStarted.getTime() > 120000){
      background(0, 0, 0);
      lastMode = "blitz";
      currentBackground.displayWin();
      currentBackground.blitz = false;
      currentBoard.gameEnd = true;
      won = true;
    }
    else if(currentBoard.gameEnd && !won){
      background(0, 0, 0);
      if (currentBackground.sprint) {
        lastMode = "sprint";
        currentBackground.sprint = false;
      }
      if (currentBackground.blitz) {
        lastMode = "blitz";
        currentBackground.sprint = false;
      }
      currentBackground.displayDefeat();
    }
  }
  
  void frame(){
    currentBackground.displayBoard();
    currentBackground.displayGhost();
    currentBackground.displayPiece();
    currentBackground.displayQueue();
    currentBackground.displayHold();
    currentBackground.timeSinceStarted.updateTime();    
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
