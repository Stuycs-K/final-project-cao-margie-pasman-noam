class Board{
  char[][] board;
  Piece currentPiece;
  Piece[] pieceQueue;
  Piece heldPiece;
  
  int score;
  Timer timer;
  
  Board(){
    board = new char[23][10];
    for(int i = 0; i < board.length; i++){
      for(int j = 0 ; j < board[i].length; j++){
        board[i][j] = ' ';
      }
    }    
  }
  
  boolean end(){
    return false;
  }
  
  void drop(){
    currentPiece.mergeIntoBoard();
    for(int i = 19; i >= 0; i--){
      if(canClear(i)){
        clearLine(i);
      }
    }
    currentPiece = pieceQueue[0];
    for(int i = 0; i < pieceQueue.length; i++){
      pieceQueue[i] = pieceQueue[i+1];
      pieceQueue[pieceQueue.length-1] = new Piece('t', this);
    }
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
    for(int i = row; i < board.length; i++){
      for(int j = 0; j < board[0].length; j++){
        board[i][j] = board[i+1][j];
      }
    }
  }
  
  
}
