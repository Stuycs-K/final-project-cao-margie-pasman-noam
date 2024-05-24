Tetris tetris = new Tetris();

void setup(){
  size(500,1000);
  tetris.startGame();
}

void draw(){
  Background display = new Background();
  display.displayBoard(tetris.currentBoard);
}
