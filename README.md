[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
The Tetrominoes  
Margie Cao, Noam Pasman  
Period 3

## Overview
This project is a Tetris game, designed to model the Tetris features on the online platform Tetrio as closely as possible.
Tetris has greatly evolved from its original form, and modern
Tetris has many features that improve the gameplay experience.
We have tried to add as many of these features as possible,
including hard drops, better piece rotation,
7-bag randomization, smarter scoring systems, and
DAS (Delayed Auto-Shift).

Users will be directed from the start screen
to choose one of several modes in which to play, and then
will be transferred to the main game screen. Once the user
either tops out or wins (in certain modes, users can win),
they will be directed to the end screen, from which they can
choose to play again.

## Instructions

Our project does not require any additional libraries
to be installed.

The keybindings used in for our project are as follows:
- k: Move Piece Down
- j: Move Piece Left
- l: Move Piece Right
- i: Spin Piece Clockwise (90 degrees)
- z: Spin Piece Counterclockwise (90 degrees)
- a: Spin Piece 180 degrees
- Space: Hard Drop Piece
(Piece immediately drops to the bottom)
- c: Hold Piece
(a piece must be dropped between any two holds)

Here are some ways to test interesting features in our project:
- Try clearing multiple lines at once (it works!)
- Let the program run on its own,
and see that pieces eventually drop down to the bottom
- Try rotating pieces or moving pieces to places
where the board is already full (you can't!)
- Repeatedly hit the space bar at the start of the program
to stack the pieces and see the game end screen