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

void mouseClicked() {
  if (tetris.currentBackground.onMenu) {
    if (mouseX > 350 && mouseX < 975 && mouseY > 200 && mouseY < 300) {
      tetris.currentBackground.sprint = true;
      tetris.currentBackground.onMenu = false;
      background(0, 0, 0);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 350 && mouseY < 450) {
      tetris.currentBackground.blitz = true;
      tetris.currentBackground.onMenu = false;
      background(0, 0, 0);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 500 && mouseY < 600) {
      tetris.currentBackground.zen = true;
      tetris.currentBackground.onMenu = false;
      background(0, 0, 0);
    }
  }
}
