Tetris tetris;

boolean pressedcw;
boolean pressedccw;
boolean pressedhalf;
boolean pressedSpace;
boolean pressedHold;

void setup(){
  size(1000,700);
  tetris = new Tetris();
  
  pressedcw = false;
  pressedccw = false;
  pressedhalf = false;
  pressedSpace = false;
  pressedHold = false;
  tetris.startGame();
}

void draw(){
  tetris.mode();
}

void keyPressed(){
  if (!tetris.currentBackground.onMenu) {
    if(key == 'k'){
      tetris.pressedDown = true;
    }
    if(key == 'j'){
      tetris.pressedLeft = true;
    }
    if(key == 'l'){
      tetris.pressedRight = true;
    }
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
    if(key == ' '){
      if(!pressedSpace){
        tetris.hardDrop();
      }
      pressedSpace = true;
    }
    if(key == 'c'){
      if(!pressedHold){
        tetris.hold();
      }
      pressedHold = true;
    }
  }
}

void keyReleased(){
  if(key == 'k'){
    tetris.pressedDown = false;
    tetris.downCounter = 0;
  }
  if(key == 'j'){
    tetris.pressedLeft = false;
    tetris.leftCounter = 0;
  }
  if(key == 'l'){
    tetris.pressedRight = false;
    tetris.rightCounter = 0;
  }
  if(key == 'i'){
      pressedcw = false;
    }
  if(key == 'z'){
    pressedccw = false;
  }
  if(key == 'a'){
    pressedhalf = false;
  }
  if(key == ' '){
    pressedSpace = false;
  }
  if(key == 'c'){
    pressedHold = false;
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
