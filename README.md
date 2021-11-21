# CS-203-Project
Digital Logic Design
Created by -
Rohan (2020CSB1117)
Raghav Patidar (2020CSB1115)

This project is a design of working of Tic-Tac-Toe game.
First of all, 01 denotes player and 10 denotes the computer.

// FOR DESIGN PART 

We instantiate various modules in the main ticTacToe module.
1. Position Register : To store positions of players when FSM controller is enabled
2. FSM Controller : Controls the gameplay
3. NoSpaceDtector : To detect if there is more available space to play.
4. illegalMoveDetector : Ensures fair gamelpay by ensuring all moves are correct.
5. position_decoder : To decode the position being played.
6. winner_detector_across_line : Take value at 3 positions of grid and tells if there is a winner in it.
7. winner_detector : Runs over all possible lines {rows, coloums and diagnols} and check if there is a winner from them.

// FOR TEST-BENCH PART
We took three Cases :
1. Computer wins : Winner Output -> 10
2. Draw or Incomplete Match : Winner Output -> 00
3. Player wins : Winner Output -> 01
So, created three modules in testbench for all three test_cases.

On running code, we will see three 3X3 grids with there winners.
