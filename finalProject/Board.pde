class Board{
  char[][] board;
  Piece currentPiece;
  Piece[] pieceQueue;
  Bag pieceBag;
  
  Piece heldPiece;
  boolean hasHeld;
  boolean firstDrop;
  
  int score;
  Timer timer;
  
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
    pieceQueue = new Piece[5];
    for(int i = 0; i < pieceQueue.length; i++){
      pieceQueue[i] = new Piece(pieceBag.removeRandom(), this);
    }
    
    hasHeld = false;
    
    score = 0;
    timer = new Timer();
    gameEnd = false;
    firstDrop = true;
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
      hasHeld = true;
    }
  }
  
  void drop(){
    currentPiece.mergeIntoBoard();
    for(int i = 19; i >= 0; i--){
      if(canClear(i)){
        clearLine(i);
      }
    }
    currentPiece = pieceQueue[0];
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
      print("end");
    }
    firstDrop = true;
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
  
  void timedDrop(){
    timer.updateTime();
    int whenToDrop;
    if(firstDrop){
      whenToDrop = 0;
      firstDrop = false;
    }else{
      whenToDrop = 1000;
    }
    if(timer.getTime() > whenToDrop){
      timer.setTime(0);
      if(!currentPiece.tryToMove(new int[] {-1,0})){
        drop();
      }
    }
  }
  
  //char pieceChooser(){
  //  int randInt = (int)(7*Math.random());
  //  if(randInt == 0){
  //    return 't';
  //  }
  //  if(randInt == 1){
  //    return 'o';
  //  }
  //  if(randInt == 2){
  //    return 'l';
  //  }
  //  if(randInt == 3){
  //    return 'j';
  //  }
  //  if(randInt == 4){
  //    return 's';
  //  }
  //  if(randInt == 5){
  //    return 'z';
  //  }
  //  if(randInt == 6){
  //    return 'i';
  //  }
  //  return ' ';
  //}
}
