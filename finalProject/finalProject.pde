Tetris tetris;

final char downKey = DOWN;
final char leftKey = LEFT;
final char rightKey = RIGHT;
final char cwKey = UP;
final char ccwKey = 'z';
final char halfSpinKey = 'a';
final char hardDropKey = ' ';
final char holdKey = 'c';
PFont tetrio;

boolean pressedcw;
boolean pressedccw;
boolean pressedhalf;
boolean pressedSpace;
boolean pressedHold;
int starting;

void setup(){
  size(1000,700);
  tetris = new Tetris();
  //tetrio = createFont("HunDIN1451.ttf", 64);
  //textFont(tetrio);
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
    if(keyCode == downKey){
      tetris.pressedDown = true;
    }
    if(keyCode == leftKey){
      tetris.pressedLeft = true;
    }
    if(keyCode == rightKey){
      tetris.pressedRight = true;
    }
    if(keyCode == cwKey){
      if(!pressedcw){
        tetris.cwSpin();
      }
      pressedcw = true;
    }
    if(key == ccwKey){
      if(!pressedccw){
        tetris.ccwSpin();
      }
      pressedccw = true;
    }
    if(key == halfSpinKey){
      if(!pressedhalf){
        tetris.halfSpin();
      }
      pressedhalf = true;
    }
    if(key == hardDropKey){
      if(!pressedSpace){
        tetris.hardDrop();
      }
      pressedSpace = true;
    }
    if(key == holdKey){
      if(!pressedHold){
        tetris.hold();
      }
      pressedHold = true;
    }
  }
}

void keyReleased(){
  if(keyCode == downKey){
    tetris.pressedDown = false;
    tetris.downCounter = 0;
  }
  if(keyCode == leftKey){
    tetris.pressedLeft = false;
    tetris.leftCounter = 0;
  }
  if(keyCode == rightKey){
    tetris.pressedRight = false;
    tetris.rightCounter = 0;
  }
  if(keyCode == cwKey){
      pressedcw = false;
    }
  if(key == ccwKey){
    pressedccw = false;
  }
  if(key == halfSpinKey){
    pressedhalf = false;
  }
  if(key == hardDropKey){
    pressedSpace = false;
  }
  if(key == holdKey){
    pressedHold = false;
  }
}

void mouseClicked() {
  if (tetris.currentBackground.onMenu) {
    if (mouseX > 350 && mouseX < 975 && mouseY > 200 && mouseY < 300) {
      tetris.startGame();
      tetris.currentBackground.sprint = true;
      tetris.currentBackground.onMenu = false;
      starting = millis();
      background(0, 0, 0);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 350 && mouseY < 450) {
      tetris.startGame();
      tetris.currentBackground.blitz = true;
      tetris.currentBackground.onMenu = false;
      starting = millis();
      background(0, 0, 0);
    }
    if (mouseX > 350 && mouseX < 975 && mouseY > 500 && mouseY < 600) {
      tetris.startGame();
      tetris.currentBackground.zen = true;
      tetris.currentBackground.onMenu = false;
      background(0, 0, 0);
    }
  }
  if (tetris.currentBoard.gameEnd) {
    if (mouseX > 110 && mouseX < 490 && mouseY > 500 && mouseY < 600) {
      background(0, 0, 0);
      tetris.currentBackground.onMenu = true;
      tetris.currentBackground.sprint = false;
      tetris.currentBackground.blitz = false;
      tetris.currentBackground.zen = false;
    }
    if (mouseX > 510 && mouseX < 890 && mouseY > 500 && mouseY < 600) {
      background(0, 0, 0);
      if (tetris.lastMode.equals("sprint")) {
        tetris.startGame();
        tetris.currentBackground.sprint = true;
        starting = millis();
      }
      if (tetris.lastMode.equals("blitz")) {
        tetris.startGame();
        tetris.currentBackground.blitz = true;
        starting = millis();
      }
      if (tetris.lastMode.equals("zen")) {
        tetris.startGame();
        tetris.currentBackground.zen = true;
      }
      tetris.currentBackground.onMenu = false;
    }
  }
}
