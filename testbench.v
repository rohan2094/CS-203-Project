// CS203 finall project 
// Tic-Tac-Toe
// Raghav Patidar 2020CSB1115
// Rohan Khanna 2020CSB1117

//  This is the first possible test_case in which computer will win
module tb_tic_tac_toe;
 // Inputs
 reg clk;
 reg rst;
 reg pp;
 reg pc;
 reg [3:0] computer_position;
 reg [3:0] player_position;

 // Outputs
 wire [1:0] pos1;
 wire [1:0] pos2;
 wire [1:0] pos3;
 wire [1:0] pos4;
 wire [1:0] pos5;
 wire [1:0] pos6;
 wire [1:0] pos7;
 wire [1:0] pos8;
 wire [1:0] pos9;
  wire [1:0] who;

 // Instantiate the Unit Under Test (UUT)
 tic_tac_toe_game uut (
  .clk(clk), 
   .rst(rst), 
   .pp(pp), 
  .pc(pc), 
  .computer_position(computer_position), 
  .player_position(player_position), 
  .pos1(pos1), 
  .pos2(pos2), 
  .pos3(pos3), 
  .pos4(pos4), 
  .pos5(pos5), 
  .pos6(pos6), 
  .pos7(pos7), 
  .pos8(pos8), 
  .pos9(pos9), 
  .who(who)
 );
 // clock
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 initial begin
  // Initialize Inputs
  pp = 0;
  rst = 1;
  computer_position = 0;
  player_position = 0;
  pc = 0;
  #100;
  rst = 0;
  #100;
  pp = 1;
  pc = 0;
  computer_position = 0;
  player_position = 4;
  #50;
  pc = 1;
  pp = 0;
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 1;
  player_position = 8;
  #50;
  pc = 1;
  pp = 0;  
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 2;
  player_position = 6;
  #50;
  pc = 1;
  pp = 0; 
  #50
  pc = 0;
  pp = 0;    
   $display("If winner is 01, it means player won, else if winner is 10, it means computer won , else Winner is not decided yet. \n");
   $display("Below is 3X3 matrix generated after first match :\n");
   $display(" %b %b %b \n",pos1,pos2,pos3);
   $display(" %b %b %b \n",pos4,pos5,pos6);
   $display(" %b %b %b \n",pos7,pos8,pos9);
   $display("Winner Decided is : %b \n",who);
   
  end
  
 initial
    #1000 $finish;

endmodule


//  This is the second possible test_case in which noone will win - DRAW MATCH or INCOMPLETE MATCH
module tb_tic_tac_toe2;
 // Inputs
 reg clk;
 reg rst;
 reg pp;
 reg pc;
 reg [3:0] computer_position;
 reg [3:0] player_position;

 // Outputs
 wire [1:0] pos1;
 wire [1:0] pos2;
 wire [1:0] pos3;
 wire [1:0] pos4;
 wire [1:0] pos5;
 wire [1:0] pos6;
 wire [1:0] pos7;
 wire [1:0] pos8;
 wire [1:0] pos9;
 wire [1:0] who;

 // Instantiate the Unit Under Test (UUT)
 tic_tac_toe_game uut (
  .clk(clk), 
   .rst(rst), 
   .pp(pp), 
  .pc(pc), 
  .computer_position(computer_position), 
  .player_position(player_position), 
  .pos1(pos1), 
  .pos2(pos2), 
  .pos3(pos3), 
  .pos4(pos4), 
  .pos5(pos5), 
  .pos6(pos6), 
  .pos7(pos7), 
  .pos8(pos8), 
  .pos9(pos9), 
  .who(who)
 );
 // clock
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 initial begin
  // Initialize Inputs
  pp = 0;
  rst = 1;
  computer_position = 0;
  player_position = 0;
  pc = 0;
   
  #100;
  rst = 0;
   
  #100;
  pp = 1;
  pc = 0;
  computer_position = 4;
  player_position = 0;
   
  #50;
  pc = 1;
  pp = 0;
   
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 8;
  player_position = 1;
   
  #50;
  pc = 1;
  pp = 0; 
   
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 7;
  player_position = 9;
   
  #50;
  pc = 1;
  pp = 0; 
   
  #50
  pc = 0;
  pp = 0;   
   
   $display("Now game is reset and Below is 3X3 matrix generated:\n");
   $display(" %b %b %b \n",pos1,pos2,pos3);
   $display(" %b %b %b \n",pos4,pos5,pos6);
   $display(" %b %b %b \n",pos7,pos8,pos9);
   $display("Winner Decided is : %b \n",who);
  end
  
  initial
    #1000 $finish;
     
endmodule



//  This is the third possible test_case in which player will win
module tb_tic_tac_toe3;
 // Inputs
 reg clk;
 reg rst;
 reg pp;
 reg pc;
 reg [3:0] computer_position;
 reg [3:0] player_position;

 // Outputs
 wire [1:0] pos1;
 wire [1:0] pos2;
 wire [1:0] pos3;
 wire [1:0] pos4;
 wire [1:0] pos5;
 wire [1:0] pos6;
 wire [1:0] pos7;
 wire [1:0] pos8;
 wire [1:0] pos9;
 wire [1:0] who;

 // Instantiate the Unit Under Test (UUT)
 tic_tac_toe_game uut (
  .clk(clk), 
   .rst(rst), 
   .pp(pp), 
  .pc(pc), 
  .computer_position(computer_position), 
  .player_position(player_position), 
  .pos1(pos1), 
  .pos2(pos2), 
  .pos3(pos3), 
  .pos4(pos4), 
  .pos5(pos5), 
  .pos6(pos6), 
  .pos7(pos7), 
  .pos8(pos8), 
  .pos9(pos9), 
  .who(who)
 );
 // clock
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 initial begin
  // Initialize Inputs
  pp = 0;
  rst = 1;
  computer_position = 0;
  player_position = 0;
  pc = 0;
  #100;
  rst = 0;
  #100;
  pp = 1;
  pc = 0;
  computer_position = 4;
  player_position = 0;
  #50;
  pc = 1;
  pp = 0;
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 8;
  player_position = 1;
  #50;
  pc = 1;
  pp = 0;  
  #100;
  rst = 0;
  pp = 1;
  pc = 0;
  computer_position = 6;
  player_position = 2;
  #50;
  pc = 1;
  pp = 0; 
  #50
  pc = 0;
  pp = 0;   
   
   $display("Now game is reset again and Below is 3X3 matrix generated:\n");
   $display(" %b %b %b \n",pos1,pos2,pos3);
   $display(" %b %b %b \n",pos4,pos5,pos6);
   $display(" %b %b %b \n",pos7,pos8,pos9);
   $display("Winner Decided is : %b \n",who);
  end
  
  initial
    #1000 $finish;
  
  initial 
    begin
      $dumpfile("tic_tac_toe_game3.vcd");
      $dumpvars;
    end
      
endmodule