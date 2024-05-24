class Board{
  char[][] board;
  Piece currentPiece;
  Piece[][] pieceQueue;
  Piece heldPiece;
  
  int score;
  Timer timer;
  
  public Board(){
    board = new char[][]{{'t', 't', 'l', 'j', 'i'},{'z','s','z','o','o'}};
  }
}
