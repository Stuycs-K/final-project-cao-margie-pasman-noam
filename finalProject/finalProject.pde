Tetris tetris;

void setup(){
  size(500,1000);
  tetris = new Tetris();
  tetris.startGame();
}

void draw(){
  tetris.frame();
}

void 
