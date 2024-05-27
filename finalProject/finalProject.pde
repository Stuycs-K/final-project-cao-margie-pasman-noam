Tetris tetris;

void setup(){
  size(500,1000);
  tetris = new Tetris();
  tetris.startGame();
}

void draw(){
  tetris.frame();
}

void keyPressed(){
  if(key == DOWN){tetris.moveDown();}
  if(key == LEFT){tetris.moveLeft();}
  if(key == RIGHT){tetris.moveRight();}
  if(key == UP){tetris.cwSpin();}
  if(key == 'z'){tetris.ccwSpin();}
  if(key == 'a'){tetris.halfSpin();}
  if(key == ' '){tetris.hardDrop();}
  if(key == 'c'){tetris.hold();}
}
