class Board{
  char[][] board;
  Piece currentPiece;
  Piece[][] pieceQueue;
  Piece heldPiece;
  
  int score;
  Timer timer;
  
  public Board(){
    board = new char[10][20];
    board[0][19] = 'o';
    board[9][19] = 'o';
  }
}
