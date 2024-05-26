class Board{
  char[][] board;
  Piece currentPiece;
  Piece[][] pieceQueue;
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
  
  void hold(){
    
  }
  
  void drop(){
    
  }
  
  boolean canClear(int row){
    for(int i = 0; i < board[row].length; i++){
      if(board[row][i] == ' '){
        return false;
      }
    }
    return true;
  }
  
  void clearLine(){
    
  }
  
  
  
}
