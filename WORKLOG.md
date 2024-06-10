# Work Log

## Margie Cao

### 5/23

Made and wrote displayColor function for tetris board

### 5/24

Working on using displayColor to display actual tetris board

Using a 2D char array for tetris board and looping over to display piece and color based on char

### 5/27

Finished displayBoard method

### 5/28

Made temporary displayPieceQueue, shows color of next piece but not shape

### 5/29

Finished drawPiece for displayPieceQueue

Merged with Noam's work, fixed displayBoard (was upside down before)

### 5/30

Fixed displayBoard again (was inverted before)

Finished displayPiece (currentPiece)

### 5/31

Writing displayHold, displays correct piece but disappears after hard dropping

### 6/03

Fixed and finished displayHold

### 6/05

Working on a menu screen with different modes

### 6/07

Made mouseClicked for entering different modes

Made modes change color when hovered over with mouse

### 6/09

Made time and score displays

Shifted tetris board to center of screen

Added a font

Started win screen

### 6/10

Finished win and defeat screens

Made restart and menu buttons

Restarting works properly in restarting time and score

Added displayLines for sprint

Fixed zen issues with restarting

## Noam Pasman

### 05/22

Made repo, processing folder with tabs for each class, and working branch

### 05/23

Made stubs for Background and Tetris class

Made beginning version of setup method

Made time class (done for now)

### 05/24

Made more detailed stubs for Board, Piece, and Tetris classes

Wrote code to determine shape of a block based on block type

### 05/26

Finished most of Phase 1 Piece class 
(pieceStuck, mergeIntoBoard, tryToMove, hardDrop)

Finished most of Phase 1 Board class
(canClear, clearLine, drop, pieceChooser, hold)

Coded interactivity of Board class with Tetris class
(Board Constructor, frame method)

### 05/27

Made key-based inputs linking to methods in Tetris class

### 05/28

Began coding rotations

Merged in Margie's work (displaying the board), fixed conflicts and bugs

## 05/29

Continued coding rotations

Merged in Margie's work (new displayBoard method, displayQueue), fixed conflicts and bugs

### 05/30

Fixed merge conflicts and worked on coordinating features from the two branches

### 06/03

Fixed rotation bug

Added 7-piece randomization, Added check to see if game has ended

### 06/05

Made pieces fall automatically

Merged branches together

### 06/06

Merged branches together again and fixed conflict

Updated README

### 06/07

Fixed bugs in hold and timedDrop methods

### 06/08

Made rotation, hard drop, and hold keybinds only apply once per click

Implemented piece lock delay when pieces hit the board

Made soft drop apply at a constant rate, made left and right shift
apply once, then rapidly apply afterwards
(at a different rate to the standard one)

Added wall kicks so rotations are less restrictive

### 06/09

Made ghost piece with primitive display

Made scoring identical to Tetrio scoring (except for T-spins)

Helped code conditions necessary for sprint and blitz modes to end

### 06/10

Made reset and home keybinds, which come into effect after the user
has pressed them for 2 seconds

Finalized project