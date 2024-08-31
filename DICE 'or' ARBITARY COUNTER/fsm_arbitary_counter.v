`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 19:18:29
// Design Name: 
// Module Name: fsm_arbitary_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Counts :: 1->6->3->5->4->2->1
// LIKE A DICE 

module fsm_arbitary_counter(
input clk,reset_n,en,
    output [2:0] num   
     );
 
 reg [2:0] state_next, state_reg;   
 localparam s0 = 0, s1 = 1, s2 = 2 , s3 = 3, s4 = 4, s5 = 5,
             s6 = 6, s7 = 7;
 

// state register
always@(posedge clk, negedge reset_n)
begin
    if(~reset_n)
        state_reg <= s0;
    else 
        state_reg <= state_next;
end

// next state logic
always@(*)
begin
    if(en)
    case(state_reg)
    s1 : state_next = s6;
    s2 : state_next = s1;
    s3 : state_next = s5;
    s4 : state_next = s2;
    s5 : state_next = s4;
    s6 : state_next = s3;
    default : state_next = s1;
    endcase
    
    else 
        state_next = state_reg;
end

//output logic
assign num = state_reg;
    
   
endmodule
