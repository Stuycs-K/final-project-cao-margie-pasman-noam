class Piece{
  Board board;
  int[] pivotCoords;
  
  char pieceType;
  int[][] shape;
  
  Piece(char type){
    pivotCoords = new int[2];
    pivotCoords[0] = 4;
    pivotCoords[1] = 21;
    
    pieceType = type;
    shape = new int[4][2];
    shape[0] = new int[] {0,0};
    decideShape();
  }
  
  void decideShape(){
    if(pieceType == 't'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {-1,0};
    }
    if(pieceType == 'o'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {1,1};
    }
    if(pieceType == 'l'){
      shape[1] = new int[] {1,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {-1,0};
    }
    if(pieceType == 'j'){
      shape[1] = new int[] {-1,-1};
      shape[2] = new int[] {-1,0};
      shape[3] = new int[] {1,0};
    }
    if(pieceType == 's'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {-1,0};
      shape[3] = new int[] {-1,1};
    }
    if(pieceType == 'z'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {-1,1};
    }
    if(pieceType == 'i'){
      shape[1] = new int[] {-1,0};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {2,0};
    }
  }
  
  boolean tryToMove(int[] direction){
    movePiece(direction);
    if(pieceStuck()){
      int[] oppDirection = new int[2];
      oppDirection[0] = -direction[0];
      oppDirection[1] = -direction[1];
      movePiece(oppDirection);
      return false;
    }
    return true;
  }
  
  void movePiece(int[] direction){
    pivotCoords[0] += direction[0];
    pivotCoords[1] += direction[1];
  }
  
  void hardDrop(){
    while(tryToMove(new int[] {0,-1})){}
    board.drop();
  }
  
  boolean pieceStuck(){
    return false;
  }
}
