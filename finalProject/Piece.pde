class Piece{
  Board board;
  int[] pivotCoords;
  
  char pieceType;
  int[][] shape;
  int orientation;
  int[][][] offsets;
  
  Piece(char type, Board b){
    board = b;
    pivotCoords = new int[2];
    pivotCoords[0] = 22;
    pivotCoords[1] = 4;
    
    pieceType = type;
    shape = new int[4][2];
    shape[0] = new int[] {0,0};
    decideShape();
    wallKicks = new int[4][5][2];
    decideWallKicks();
    orientation = 0;
  }
  
  boolean tryToMove(int[] direction){
    movePiece(direction);
    if(pieceStuck()){
      int[] oppDirection = new int[2];
      oppDirection[0] = -(direction[0]);
      oppDirection[1] = -(direction[1]);
      movePiece(oppDirection);
      //System.out.println("failed");
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
      if(yCoord < 0 || xCoord < 0 || yCoord >= board.board.length || xCoord >= board.board[i].length
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
  
  void spin(int numTurns){
    for(int i = 0; i < numTurns; i++){
      rotateOnce();
    }
    orientation += numTurns;
    orientation %= 4;
    if(pieceStuck()){
      spin(4-numTurns);
    }
  }
  
  void rotateOnce(){
    for(int i = 1; i < 4; i++){
      int temp = shape[i][1];
      shape[i][1] = -shape[i][0];
      shape[i][0] = temp;
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
  
  void decideOffsets(){
    if(pieceType == 'i'){
      offsets = new int[][][] {{{0,0},{-1,0},{2,0},{-1,0},{2,0}},
                              {{-1,0},{0,0},{0,0},{0,1},{0,-2}},
                              {{-1,1},{1,1},{-2,1},{1,0},{-2,0}},
                              {{0,1},{0,1},{0,1},{0,-1},{0,2}}};
    }
    else if(pieceType == 'o'){
      offsets = new int[][][] {{{0,0},{0,0},{0,0},{0,0},{0,0}},
                              {{0,-1},{0,-1},{0,-1},{0,-1},{0,-1}},
                              {{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1}},
                              {{-1,0},{-1,0},{-1,0},{-1,0},{-1,0}}};
    }
    else{
      offsets = new int[][][] {{{0,0},{0,0},{0,0},{0,0},{0,0}},
                              {{0,0},{1,0},{1,-1},{0,2},{1,2}},
                              {{0,0},{0,0},{0,0},{0,0},{0,0}},
                              {{0,0},{-1,0},{-1,-1},{0,2},{-1,2}}};
    }    
  }
}
