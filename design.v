// CS203 finall project 
// Tic-Tac-Toe
// Raghav Patidar 2020CSB1115
// Rohan Khanna 2020CSB1117



module tic_tac_toe_game(
  
     input clk, // clock 
     input rst, // reset button
     input pp, // enable player to play
     input pc, // enable computer to play
     input [3:0] computer_position,player_position, // positions to play
     output wire [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,
    
     // 01: Player 
     // 10: Computer 
  
  output wire[1:0]who // finall winner of game
     );
  
  wire computer_enable; // signal to enable computer
  wire player_enable; // signal to enable player
  wire [15:0] PC_en_signal;// Computer enable signals
  wire [15:0] PL_en_signal; // Player enable signals
  wire illegal_move; //when an illegal move is detected then it disable writing
  wire win_signal; // win signal
  wire no_space_signal; // no space signal
  
  
 // position registers
  position_registers position_reg_unit(
      clk, // clock
      rst, // reset button
      illegal_move, //when an illegal move is detected then it disable writing
      PC_en_signal[8:0], // Computer enable signals 
      PL_en_signal[8:0], // Player enable signals 
      pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9// positions stored
      );
  
 // winner detector
  winner_detector win_detect_unit(pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,win_signal,who);
  
 // position decoder for computer 
  position_decoder pdecoder1(computer_position,computer_enable,PC_en_signal);
  
 // position decoder for player  
  position_decoder pdecoder2(player_position,player_enable,PL_en_signal); 
  
 // illegal move detector
  illegal_move_detector i_m_d(
   pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
    PC_en_signal[8:0], PL_en_signal[8:0], 
   illegal_move
   );
  
 // no space detector 
 nospace_detector n_s_d(
   pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   no_space_signal
    ); 
  
  //Fsm Controller to control the game play
 fsm_controller tic_tac_toe_controller(
     clk,// clock 
     rst,// reset button
     pp, // player chance 
     pc,// computer chance 
     illegal_move,// illegal move detected 
     no_space_signal, // no_space detected 
     win_signal, // winner detected 
     computer_enable, // enable computer to play 
     player_enable // enable player to play 
     );    
  
endmodule

// Position registers to store player and computer positions when enabling by the FSM controller

module position_registers(
      input clk, // clock of the game
      input rst, // reset the game 
      input illegal_move, // disable writing when an illegal move is detected 
  input [8:0] PC_en_signal, // Computer enable signals 
  input [8:0] PL_en_signal, // Player enable signals 
      output reg[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9// positions stored
      );
  
 // Position 1 
  always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos1 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos1 <= pos1;// keep previous position
   else if(PC_en_signal[0]==1'b1)
    pos1 <= 2'b10; // store computer data 
   else if (PL_en_signal[0]==1'b1)
    pos1 <= 2'b01;// store player data 
   else 
    pos1 <= pos1;// keep previous position
  end 
 end 
  
 // Position 2 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos2 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos2 <= pos2;// keep previous position
   else if(PC_en_signal[1]==1'b1)
    pos2 <= 2'b10; // store computer data 
   else if (PL_en_signal[1]==1'b1)
    pos2 <= 2'b01;// store player data 
   else 
    pos2 <= pos2;// keep previous position
  end 
 end 
  
// Position 3 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos3 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos3 <= pos3;// keep previous position
   else if(PC_en_signal[2]==1'b1)
    pos3 <= 2'b10; // store computer data 
   else if (PL_en_signal[2]==1'b1)
    pos3 <= 2'b01;// store player data 
   else 
    pos3 <= pos3;// keep previous position
  end 
 end  
  
 // Position 4 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos4 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos4 <= pos4;// keep previous position
   else if(PC_en_signal[3]==1'b1)
    pos4 <= 2'b10; // store computer data 
   else if (PL_en_signal[3]==1'b1)
    pos4 <= 2'b01;// store player data 
   else 
    pos4 <= pos4;// keep previous position
  end 
 end 
  
 // Position 5 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos5 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos5 <= pos5;// keep previous position
   else if(PC_en_signal[4]==1'b1)
    pos5 <= 2'b10; // store computer data 
   else if (PL_en_signal[4]==1'b1)
    pos5 <= 2'b01;// store player data 
   else 
    pos5 <= pos5;// keep previous position
  end 
 end 
  
 // Position 6 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos6 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos6 <= pos6;// keep previous position
   else if(PC_en_signal[5]==1'b1)
    pos6 <= 2'b10; // store computer data 
   else if (PL_en_signal[5]==1'b1)
    pos6 <= 2'b01;// store player data 
   else 
    pos6 <= pos6;// keep previous position
  end 
 end 
  
 // Position 7 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos7 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos7 <= pos7;// keep previous position
   else if(PC_en_signal[6]==1'b1)
    pos7 <= 2'b10; // store computer data 
   else if (PL_en_signal[6]==1'b1)
    pos7 <= 2'b01;// store player data 
   else 
    pos7 <= pos7;// keep previous position
  end 
 end 
  
 // Position 8 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos8 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos8 <= pos8;// keep previous position
   else if(PC_en_signal[7]==1'b1)
    pos8 <= 2'b10; // store computer data 
   else if (PL_en_signal[7]==1'b1)
    pos8 <= 2'b01;// store player data 
   else 
    pos8 <= pos8;// keep previous position
  end 
 end 
  
 // Position 9 
 always @(posedge clk or posedge rst)
 begin
  if(rst) 
   pos9 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos9 <= pos9;// keep previous position
   else if(PC_en_signal[8]==1'b1)
    pos9 <= 2'b10; // store computer data 
   else if (PL_en_signal[8]==1'b1)
    pos9 <= 2'b01;// store player data 
   else 
    pos9 <= pos9;// keep previous position
  end 
 end  
endmodule 

// FSM controller to control how player and computer play the game

module fsm_controller(
     input clk,// clock of the circuit 
     input rst,// reset 
     pp, // player plays 
     pc,// computer plays 
     illegal_move,// illegal move detected 
     no_space, // no_space detected 
     win, // winner detected 
     output reg computer_play, // enable computer to play 
     player_play // enable player to play 
     );
  
// FSM States 
parameter IDLE=2'b00;
parameter PLAYER=2'b01;
parameter COMPUTER=2'b10;
parameter GAME_COMPLETE=2'b11;
reg[1:0] current_state, next_state;
  
// current state registers 
  always @(posedge clk or posedge rst) 
begin 
  if(rst)
  current_state <= IDLE;
 else 
  current_state <= next_state;
end 
  
 // next state 
always @(*)
 begin
 case(current_state)
 IDLE: begin 
   if(rst==1'b0 && pp == 1'b1)
   next_state <= PLAYER; // player to play 
  else 
   next_state <= IDLE;
  player_play <= 1'b0;
  computer_play <= 1'b0;
 end 
 PLAYER:begin 
  player_play <= 1'b1;
  computer_play <= 1'b0;
  if(illegal_move==1'b0)
   next_state <= COMPUTER; // computer to play 
  else 
   next_state <= IDLE;
 end 
 COMPUTER:begin 
  player_play <= 1'b0;
  if(pc==1'b0) begin 
   next_state <= COMPUTER;
   computer_play <= 1'b0;
  end
  else if(win==1'b0 && no_space == 1'b0)
  begin 
   next_state <= IDLE;
   computer_play <= 1'b1;// computer to play when PC=1
  end 
  else if(no_space == 1 || win ==1'b1)
  begin 
   next_state <= GAME_COMPLETE; // game done 
   computer_play <= 1'b1;// computer to play when PC=1
  end  
 end 
 GAME_COMPLETE:begin // game done
  player_play <= 1'b0;
  computer_play <= 1'b0; 
   if(rst==1'b1) 
   next_state <= IDLE;// reset the game to IDLE 
  else 
   next_state <= GAME_COMPLETE;  
 end 
 default: next_state <= IDLE; 
 endcase
 end
endmodule

// NO SPACE detector
// to detect if no more spaces to play
module nospace_detector(
   input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   output wire no_space
    );
wire t1,t2,t3,t4,t5,t6,t7,t8,t9;
// detect no more space     
assign t1 = pos1[1] | pos1[0];
assign t2 = pos2[1] | pos2[0];
assign t3 = pos3[1] | pos3[0];
assign t4 = pos4[1] | pos4[0];
assign t5 = pos5[1] | pos5[0];
assign t6 = pos6[1] | pos6[0];
assign t7 = pos7[1] | pos7[0];
assign t8 = pos8[1] | pos8[0];
assign t9 = pos9[1] | pos9[0];
// output
assign no_space =((((((((t1 & t2) & t3) & t4) & t5) & t6) & t7) & t8) & t9);
endmodule 


// Illegal move detector
// to detect if a player plays on an exist position 

module illegal_move_detector(
   input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
  input [8:0] PC_en_signal, PL_en_signal, 
   output wire illegal_move
   );
wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15,t16,t17,t18,t19,t21,t22;

// player : illegal moving
  
assign t1 = (pos1[1] | pos1[0]) & PL_en_signal[0];
assign t2 = (pos2[1] | pos2[0]) & PL_en_signal[1];
assign t3 = (pos3[1] | pos3[0]) & PL_en_signal[2];
assign t4 = (pos4[1] | pos4[0]) & PL_en_signal[3];
assign t5 = (pos5[1] | pos5[0]) & PL_en_signal[4];
assign t6 = (pos6[1] | pos6[0]) & PL_en_signal[5];
assign t7 = (pos7[1] | pos7[0]) & PL_en_signal[6];
assign t8 = (pos8[1] | pos8[0]) & PL_en_signal[7];
assign t9 = (pos9[1] | pos9[0]) & PL_en_signal[8];
  
// computer : illegal moving  
assign t11 = (pos1[1] | pos1[0]) & PC_en_signal[0];
assign t12 = (pos2[1] | pos2[0]) & PC_en_signal[1];
assign t13 = (pos3[1] | pos3[0]) & PC_en_signal[2];
assign t14 = (pos4[1] | pos4[0]) & PC_en_signal[3];
assign t15 = (pos5[1] | pos5[0]) & PC_en_signal[4];
assign t16 = (pos6[1] | pos6[0]) & PC_en_signal[5];
assign t17 = (pos7[1] | pos7[0]) & PC_en_signal[6];
assign t18 = (pos8[1] | pos8[0]) & PC_en_signal[7];
assign t19 = (pos9[1] | pos9[0]) & PC_en_signal[8];
  
// intermediate signals 
assign t21 =((((((((t1 | t2) | t3) | t4) | t5) | t6) | t7) | t8) | t9);
assign t22 =((((((((t11 | t12) | t13) | t14) | t15) | t16) | t17) | t18) | t19);
// output illegal move 
assign illegal_move = t21 | t22 ;
endmodule 

// To decode the position being played, a 4-to-16 decoder with high active output is needed.
// When a button is pressed, a player will play and the position at IN [3:0] will be decoded
// to enable writing to the corresponding registers
module position_decoder(input[3:0] in, input enable, output wire [15:0] out_en);
  
 reg[15:0] t1;
 assign out_en = (enable==1'b1)?t1:16'd0;
 always @(*)
 begin
 case(in)
 4'd0: t1 <= 16'b0000000000000001;
 4'd1: t1 <= 16'b0000000000000010; 
 4'd2: t1 <= 16'b0000000000000100;
 4'd3: t1 <= 16'b0000000000001000;
 4'd4: t1 <= 16'b0000000000010000;
 4'd5: t1 <= 16'b0000000000100000;
 4'd6: t1 <= 16'b0000000001000000;
 4'd7: t1 <= 16'b0000000010000000;
 4'd8: t1 <= 16'b0000000100000000;
 4'd9: t1 <= 16'b0000001000000000;
 4'd10: t1 <= 16'b0000010000000000;
 4'd11: t1 <= 16'b0000100000000000;
 4'd12: t1 <= 16'b0001000000000000;
 4'd13: t1 <= 16'b0010000000000000;
 4'd14: t1 <= 16'b0100000000000000;
 4'd15: t1 <= 16'b1000000000000000;
 default: t1 <= 16'b0000000000000001; 
 endcase 
end 
endmodule 

// winner detector circuit 
// to detect who the winner is 
// We will win when we have 3 similar (x) or (O) in the following pairs:
// (1,2,3); (4,5,6);(7,8,9); (1,4,7); (2,5,8);(3,6,9); (1,5,9);(3,5,7);

module winner_detector(input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, output wire winner, output wire [1:0]who);
wire win1,win2,win3,win4,win5,win6,win7,win8;
wire [1:0] who1,who2,who3,who4,who5,who6,who7,who8;
  
winner_detect_across_line u1(pos1,pos2,pos3,win1,who1);// (1,2,3);
winner_detect_across_line u2(pos4,pos5,pos6,win2,who2);// (4,5,6);
winner_detect_across_line u3(pos7,pos8,pos9,win3,who3);// (7,8,9);
winner_detect_across_line u4(pos1,pos4,pos7,win4,who4);// (1,4,7);
winner_detect_across_line u5(pos2,pos5,pos8,win5,who5);// (2,5,8);
winner_detect_across_line u6(pos3,pos6,pos9,win6,who6);// (3,6,9);
winner_detect_across_line u7(pos1,pos5,pos9,win7,who7);// (1,5,9);
winner_detect_across_line u8(pos3,pos5,pos6,win8,who8);// (3,5,7);
  
assign winner = (((((((win1 | win2) | win3) | win4) | win5) | win6) | win7) | win8);
assign who = (((((((who1 | who2) | who3) | who4) | who5) | who6) | who7) | who8);
endmodule 

// winner detection for 3 positions and determine who the winner is 
// Player: 01
// Computer: 10

module winner_detect_across_line(input [1:0] pos0,pos1,pos2, output wire winner, output wire [1:0]who);
wire [1:0] temp0,temp1,temp2;
wire temp3;
assign temp0[1] = !(pos0[1]^pos1[1]);
assign temp0[0] = !(pos0[0]^pos1[0]);
assign temp1[1] = !(pos2[1]^pos1[1]);
assign temp1[0] = !(pos2[0]^pos1[0]);
assign temp2[1] = temp0[1] & temp1[1];
assign temp2[0] = temp0[0] & temp1[0];
assign temp3 = pos0[1] | pos0[0];
// winner if 3 positions are similar and should be 01 or 10 
assign winner = temp3 & temp2[1] & temp2[0];
// determine who the winner is 
assign who[1] = winner & pos0[1];
assign who[0] = winner & pos0[0];
endmodule
