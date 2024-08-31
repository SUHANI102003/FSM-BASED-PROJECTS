`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 10:30:11
// Design Name: 
// Module Name: moore_3ff_011_seq_detect
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


module moore_3ff_011_seq_detect(
input clk,reset_n,x,
    output y
    );
    
reg [2:0] state_next, state_reg;

// state register
always@(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        state_reg <= 'b0;
    else
        state_reg <= state_next;
end

//next state logic
always@(*)
begin
    state_next = {x,state_reg[2:1]};
end

// output logic
assign y =  state_reg[2] & state_reg[1] & ~state_reg[0];
    
  
    
endmodule
