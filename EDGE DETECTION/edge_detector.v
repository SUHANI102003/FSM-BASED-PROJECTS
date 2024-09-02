`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 16:54:05
// Design Name: 
// Module Name: edge_detector
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

// this is generic
// can you anytime you need a button
module edge_detector(
input level,clk,reset_n,
    output p_edge, n_edge,_edge
    );
 // edge detector with mealy o/p
 reg [1:0] state_next, state_reg;   
 
 parameter s0 = 0, s1 = 1;

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
    case(state_reg)
    s0 : if(~level)
            state_next = s0;
         else 
             state_next = s1;
    s1 : if(~level)
            state_next = s0;
         else
             state_next = s1;
    default : state_next = s0;
    endcase
end

//output logic
assign p_edge = (state_reg == s0) & level ;
assign n_edge = (state_reg == s1) & ~level ;
assign _edge = p_edge | n_edge ;
endmodule
