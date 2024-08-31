`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 10:28:08
// Design Name: 
// Module Name: mealy_011_seq_detector
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


module mealy_011_seq_detector(
input clk,reset_n,x,
output y
    );
    
reg [1:0] state_next, state_reg;

// state register
always@(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        state_reg <= 1'b0;
    else
        state_reg <= state_next;
end

//next state logic
always@(*)
begin
    state_next[1] = x & state_reg[0] & ~state_reg[1];
    state_next[0] = (~x & ~state_reg[0]) | (~x & ~state_reg[1]);
end

// output logic
assign y = x & state_reg[1] & ~state_reg[0];
   
endmodule
