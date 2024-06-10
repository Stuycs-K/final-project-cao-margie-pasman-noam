class Board{
  char[][] board;
  Piece currentPiece;
  Piece ghostPiece;
  Piece[] pieceQueue;
  Bag pieceBag;
  
  Piece heldPiece;
  boolean hasHeld;
  boolean firstDrop;
  
  boolean pieceTouchingBoard;
  int numMovesWhileTouching;
  
  int score;
  Timer timer;
  int linesCleared;
  int comboCounter;
  boolean backToBack;
  
  boolean gameEnd;
  
  Board(){
    board = new char[24][10];
    for(int i = 0; i < board.length; i++){
      for(int j = 0 ; j < board[i].length; j++){
        board[i][j] = ' ';
      }
    }
    pieceBag = new Bag();
    currentPiece = new Piece(pieceBag.removeRandom(), this);
    ghostPiece = new Piece(currentPiece.pieceType, this);
    updateGhostPiece();
    pieceQueue = new Piece[5];
    for(int i = 0; i < pieceQueue.length; i++){
      pieceQueue[i] = new Piece(pieceBag.removeRandom(), this);
    }
    
    hasHeld = false;
    
    score = 0;
    timer = new Timer();
    linesCleared = 0;
    comboCounter = -1;
    backToBack = false;
    gameEnd = false;
    firstDrop = true;
    resetLockDelayVars();
  }
  
  void hold(){
    if(!hasHeld){
      Piece temp = new Piece(currentPiece.pieceType, this);
      if(heldPiece != null){
        currentPiece = heldPiece;
      }else{
        currentPiece = pieceQueue[0];
        for(int i = 0; i < pieceQueue.length-1; i++){
          pieceQueue[i] = pieceQueue[i+1];
        }
        if(pieceBag.bagEmpty()){
            pieceBag = new Bag();
        }
        pieceQueue[pieceQueue.length-1] = new Piece(pieceBag.removeRandom(), this);
        }
      heldPiece = temp;
      ghostPiece = new Piece(currentPiece.pieceType, this);
      updateGhostPiece();
      hasHeld = true;
    }
  }
  
  void drop(){
    //print("dropped");
    currentPiece.mergeIntoBoard();
    int linesThisTurn = 0;
    for(int i = 19; i >= 0; i--){
      if(canClear(i)){
        clearLine(i);
        linesCleared++;
        linesThisTurn++;
      }
    }
    int addedScore = 0;
    if(allClear()){
      addedScore += 3500;
    }
    if(linesThisTurn == 1){
      addedScore += 100;
    }
    if(linesThisTurn == 2){
      addedScore += 300;
    }
    if(linesThisTurn == 3){
      addedScore += 500;
    }
    if(linesThisTurn == 4){
      if(backToBack){
        addedScore += 800 * 1.5;
      }else{
        addedScore += 800;
      }
    }
    if(linesThisTurn > 0){
      comboCounter++;
      if(linesThisTurn < 4){
        backToBack = false;
      }else{
        backToBack = true;
      }
    }else{
      comboCounter = -1;
    }
    if(comboCounter > 0){
      addedScore += 50 * comboCounter;
    }
    score += addedScore;
    
    currentPiece = pieceQueue[0];
    ghostPiece = new Piece(currentPiece.pieceType, this);
    updateGhostPiece();
    for(int i = 0; i < pieceQueue.length-1; i++){
      pieceQueue[i] = pieceQueue[i+1];
    }
    if(pieceBag.bagEmpty()){
      pieceBag = new Bag();
    }
    pieceQueue[pieceQueue.length-1] = new Piece(pieceBag.removeRandom(), this);
    hasHeld = false;
    if(currentPiece.pieceStuck()){
        gameEnd = true;
    }
    firstDrop = true;
    resetLockDelayVars();
  }
  
  boolean canClear(int row){
    for(int i = 0; i < board[row].length; i++){
      if(board[row][i] == ' '){
        return false;
      }
    }
    return true;
  }
  
  void clearLine(int row){
    for(int i = row; i < board.length-1; i++){
      for(int j = 0; j < board[0].length; j++){
        board[i][j] = board[i+1][j];
      }
    }
  }
  
  boolean allClear(){
    for(int i = 0; i < board.length; i++){
      for(int j = 0; j < board[0].length; j++){
        if(board[i][j] != ' '){
          return false;
        }
      }
    }
    return true;
  }
  
  void timedDrop(){
    timer.updateTime();
    int whenToDrop;
    if(firstDrop){
      whenToDrop = 0;
      firstDrop = false;
    }else if(pieceTouchingBoard){
      whenToDrop = 500;
    }else{
      whenToDrop = 1000;
    }
    if(timer.getTime() > whenToDrop){
      timer.setTime(0);
      if(!currentPiece.tryToMove(new int[] {-1,0})){
        drop();
      }
      resetLockDelayVars();
    }
  }
  
  void lockDelay(){
    if(pieceTouchingBoard && numMovesWhileTouching <= 15){
      timer.setTime(0);
      numMovesWhileTouching++;
    }
  }
  
  void setPieceTouchingBoardTime(){
    if(!pieceTouchingBoard && currentPiece.pieceTouchingBoard()){
      timer.setTime(0);
      pieceTouchingBoard = true;
      //print("set");
    }
  }
  
  void resetLockDelayVars(){
    pieceTouchingBoard = false;
    numMovesWhileTouching = 0;
  }
  
  void updateGhostPiece(){
    ghostPiece.pivotCoords[0] = currentPiece.pivotCoords[0];
    ghostPiece.pivotCoords[1] = currentPiece.pivotCoords[1];
    ghostPiece.shape = currentPiece.shape;
    ghostPiece.hardDrop(true);
  }
}
