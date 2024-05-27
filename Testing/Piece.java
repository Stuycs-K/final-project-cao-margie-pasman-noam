public class Piece{
  public Board board;
  public int[] pivotCoords;
  
  public char pieceType;
  public int[][] shape;
  
  public Piece(char type, Board b){
    board = b;
    pivotCoords = new int[2];
    pivotCoords[0] = 4;
    pivotCoords[1] = 21;
    
    pieceType = type;
    shape = new int[4][2];
    shape[0] = new int[] {0,0};
    decideShape();
  }
  
  public void decideShape(){
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
  
  public boolean tryToMove(int[] direction){
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
  
  public void movePiece(int[] direction){
    pivotCoords[0] += direction[0];
    pivotCoords[1] += direction[1];
  }
  
  public void hardDrop(){
    while(tryToMove(new int[] {0,-1})){}
    board.drop();
  }
  
  public boolean pieceStuck(){
    for(int i = 0; i < 4; i++){
      if(board.board[shape[i][0]+pivotCoords[0]][shape[i][1]+pivotCoords[1]] != ' '){
        return true;
      }
    }
    return false;
  }
  
  public void mergeIntoBoard(){
    for(int i = 0; i < 4; i++){
      board.board[shape[i][0]+pivotCoords[0]][shape[i][1]+pivotCoords[1]] = pieceType;
    }
  }
}