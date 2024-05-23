class Board{
  char[][] board;
  Piece currentPiece;
  Piece[][] pieceQueue;
  Piece heldPiece;
  
  int score;
  Timer timer;
  
  public Board(){
    board = new char[23][10];
    
  }
}
