public class Test{
  public static void main(String[] args){
    Board board = new Board();

    for(int i = 0; i < board.board[0].length-1; i++){
        board.board[0][i] = 'j';
    }
    if(board.canClear(0)){
        System.out.println("Yes");
        board.clearLine(0);
    }
    
    board.board[0][board.board[0].length-1]='j';
    for(int i = 0; i < 10; i++){
        board.currentPiece.tryToMove(new int[] {-1,0});
    }
    board.drop();
    //System.out.print(board);

    for(int i = 0; i < 12; i++){
        board.currentPiece.tryToMove(new int[] {-1,0});
    }
    board.drop();
    //System.out.print(board);

    
    for(int i = 0; i < 5; i++){
        board.currentPiece.tryToMove(new int[] {-1,-1});
    }
    board.currentPiece.hardDrop();


    System.out.print(board);
  }
}