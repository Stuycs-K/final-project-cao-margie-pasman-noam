Tetris tetris;

void setup(){
  size(1000,700);
  tetris = new Tetris();
  tetris.startGame();
}

void draw(){
  tetris.mode();
}

void keyPressed(){
  if (!tetris.currentBackground.onMenu) {
    if(key == 'k'){tetris.moveDown();}
    if(key == 'j'){tetris.moveLeft();}
    if(key == 'l'){tetris.moveRight();}
    if(key == 'i'){tetris.cwSpin();}
    if(key == 'z'){tetris.ccwSpin();}
    if(key == 'a'){tetris.halfSpin();}
    if(key == ' '){tetris.hardDrop();}
    if(key == 'c'){tetris.hold();}
  }
}
