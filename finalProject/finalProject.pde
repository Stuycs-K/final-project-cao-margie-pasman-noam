Tetris tetris;
boolean pressedcw;
boolean pressedccw;
boolean pressedhalf;

void setup(){
  size(1000,700);
  tetris = new Tetris();
  pressedcw = false;
  pressedccw = false;
  pressedhalf = false;
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
    if(key == 'i'){
      if(!pressedcw){
        tetris.cwSpin();
      }
      pressedcw = true;
    }
    if(key == 'z'){
      if(!pressedccw){
        tetris.ccwSpin();
      }
      pressedccw = true;
    }
    if(key == 'a'){
      if(!pressedhalf){
        tetris.halfSpin();
      }
      pressedhalf = true;
    }
    if(key == ' '){tetris.hardDrop();}
    if(key == 'c'){tetris.hold();}
  }
}

void keyReleased(){
  if(key == 'i'){
      pressedcw = false;
    }
    if(key == 'z'){
      pressedccw = false;
    }
    if(key == 'a'){
      pressedhalf = false;
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
