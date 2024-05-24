class Board{
  char[][] board;
  Piece currentPiece;
  Piece[][] pieceQueue;
  Piece heldPiece;
  
  int score;
  Timer timer;
  
  Board(){
    board = new char[23][10];
    
  }
  
  boolean end(){
    return false;
  }
  
  void hold(){
    
  }
  
  void drop(){
    
  }
  
  boolean canClear(){
    return false;
  }
  
  void clearLine(){
    
  }
  
  boolean pieceStuck(){
    return false;
  }
  
  boolean canMove(char direction){
    if(direction == 'd'){
      
    }
    if(direction == 'l'){
      
    }
    if(direction == 'r'){
      
    }
    return true;
  }
  
  void movePiece(char direction){
    
  }
  
  void hardDrop(){
    while(canMove('d')){
      movePiece('d');
    }
    drop();
  }
  
}
