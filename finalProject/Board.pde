class Board{
  char[][] board;
  Piece currentPiece;
  Piece[] pieceQueue;
  
  Piece heldPiece;
  boolean hasHeld;
  
  int score;
  Timer timer;
  
  Board(){
    board = new char[10][24];
    for(int i = 0; i < board.length; i++){
      for(int j = 0 ; j < board[i].length; j++){
        board[i][j] = ' ';
      }
    }
    currentPiece = new Piece(pieceChooser(), this);
    pieceQueue = new Piece[5];
    for(int i = 0; i < pieceQueue.length; i++){
      pieceQueue[i] = new Piece(pieceChooser(), this);
    }
    
    hasHeld = false;
    
    score = 0;
    timer = new Timer();
  }
  
  void hold(){
    if(!hasHeld){
      Piece temp = new Piece(currentPiece.pieceType, this);
      currentPiece = heldPiece;
      heldPiece = temp;
    }
    hasHeld = true;
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
      pieceQueue[pieceQueue.length-1] = new Piece(pieceChooser(), this);
    }
    hasHeld = false;
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
  
  char pieceChooser(){
    int randInt = (int)(7*Math.random());
    if(randInt == 0){
      return 't';
    }
    if(randInt == 1){
      return 'o';
    }
    if(randInt == 2){
      return 'l';
    }
    if(randInt == 3){
      return 'j';
    }
    if(randInt == 4){
      return 's';
    }
    if(randInt == 5){
      return 'z';
    }
    if(randInt == 6){
      return 'i';
    }
    return ' ';
  }
}
