[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info
The Tetrominoes  
Margie Cao, Noam Pasman  
Period 3

## Video Presentation
https://drive.google.com/file/d/1zno4tRk5FNWbg2JNkYUIMcL4kFZWC0zb/view

## Overview
This project is a Tetris game, designed to model the Tetris features on the online platform Tetrio as closely as possible.
Tetris has greatly evolved from its original form, and modern
Tetris has many features that improve the gameplay experience.
We have tried to add as many of these features as possible,
including hard drops, better piece rotation,
7-bag randomization, smarter scoring systems, and
DAS (Delayed Auto-Shift).

Users will be directed from the start screen
to choose one of several modes (sprint, blitz, or zen) in which to play, and then
will be transferred to the main game screen. Once the user
either tops out or wins (in certain modes, users can win),
they will be directed to the end screen, from which they can
choose to play again.

## Instructions

Our project does not require any additional libraries
to be installed.

The keybindings used in our project are as follows:
- DOWN arrow: Move Piece Down (Soft Drop)
- LEFT arrow: Move Piece Left (Left Shift)
- RIGHT arrow: Move Piece Right (Right Shift)
- UP arrow: Spin Piece Clockwise (90 degrees)
- z: Spin Piece Counterclockwise (90 degrees)
- a: Spin Piece 180 degrees
- Space: Hard Drop Piece
(Piece immediately drops to the bottom)
- c: Hold Piece
(a piece must be dropped between any two holds)

- r: Reset the game when held for two seconds
- q: Return to the home screen when held for two seconds

When opening the program you will see the main screen, with the
option to choose sprint, blitz, or zen mode. Sprint mode ends after
40 lines have been cleared, blitz mode is a race to get as many points
as possible in 2 minutes, and zen mode will continue running until
you quit back to main.

In any of the three modes, holding down the r key for two seconds will
reset the game (in the same mode), and continuing to hold down the r key
will continually reset the game every two seconds. Holding down the
q key for two seconds will bring the program back to the menu screen.

In sprint and blitz modes, there is a win screen for the game naturally ending
and and lose screen for topping out. In zen mode, there is no way to win,
and if you lose the game will start over so you can play infinitely.

In blitz mode, the score will increase if you soft or hard drop pieces,
as well as by clearing lines. There are bonuses for clearing the entire screen,
clearing lines many times in a row, and having multiple line clears in a row
that each clear four lines (a tetris).

Holding down left shift and right shift only moves the piece once at first,
then rapidly moves it after a delay. Meanwhile, holding soft drop
moves the piece down at a constant rate, and
holding down spin, hard drop, and hold does not do anything after the initial press.

Spinning works by rotating the piece around its axis, but when this rotation is blocked
by other pieces the game will try to find nearby squares to move to. This allows
for more complex piece maneuvering and less restriction of piece motion. Try rotating
a piece in a tight space and see how the system works!

The program automatically moves the current piece down one space every second.
When the current piece reaches the area of already-dropped pieces, this
results in the piece being dropped and a new piece being selected. However,
left shifting, right shifting, and rotating the piece will temporarily stop this
drop from occuring. Try moving the piece to the floor and rapidly clicking
left shift and right shift in order to see this.