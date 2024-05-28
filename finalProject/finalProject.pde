<<<<<<< HEAD
Tetris tetris = new Tetris();

void setup(){
  size(500,1000);
=======
Tetris tetris;

void setup(){
  size(500,1000);
  tetris = new Tetris();
>>>>>>> 9dca7d6237ac082803f530245af63836ac33c1da
  tetris.startGame();
}

void draw(){
<<<<<<< HEAD
  Background display = new Background();
  display.displayBoard(tetris.currentBoard);
=======
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
>>>>>>> 9dca7d6237ac082803f530245af63836ac33c1da
}
