class Piece{
  Board board;
  int[] pivotCoords;
  
  char pieceType;
  int[][] shape;
  
  Piece(char type, Board b){
    board = b;
    pivotCoords = new int[2];
    pivotCoords[0] = 22;
    pivotCoords[1] = 4;
    
    pieceType = type;
    shape = new int[4][2];
    shape[0] = new int[] {0,0};
    decideShape();
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
    while(tryToMove(new int[] {-1,0})){}
    board.drop();
  }
  
  boolean pieceStuck(){
    for(int i = 0; i < 4; i++){
      int yCoord = shape[i][0]+pivotCoords[0];
      int xCoord = shape[i][1]+pivotCoords[1];
      if(yCoord < 0 || xCoord < 0 || yCoord >= board.board[0].length || xCoord >= board.board.length
      || board.board[yCoord][xCoord] != ' '){
        return true;
      }
    }
    return false;
  }
  
  void mergeIntoBoard(){
    for(int i = 0; i < 4; i++){
      board.board[shape[i][0]+pivotCoords[0]][shape[i][1]+pivotCoords[1]] = pieceType;
    }
  }
  
  void decideShape(){
    if(pieceType == 't'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {0,-1};
      shape[3] = new int[] {1,0};
    }
    if(pieceType == 'o'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {1,1};
    }
    if(pieceType == 'l'){
      shape[1] = new int[] {1,1};
      shape[2] = new int[] {0,1};
      shape[3] = new int[] {0,-1};
    }
    if(pieceType == 'j'){
      shape[1] = new int[] {1,-1};
      shape[2] = new int[] {0,-1};
      shape[3] = new int[] {0,1};
    }
    if(pieceType == 's'){
      shape[1] = new int[] {1,0};
      shape[2] = new int[] {0,-1};
      shape[3] = new int[] {1,1};
    }
    if(pieceType == 'z'){
      shape[1] = new int[] {0,1};
      shape[2] = new int[] {1,0};
      shape[3] = new int[] {1,-1};
    }
    if(pieceType == 'i'){
      shape[1] = new int[] {0,-1};
      shape[2] = new int[] {0,1};
      shape[3] = new int[] {0,2};
    }
  }
}
