`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 19:04:43
// Design Name: 
// Module Name: fsm_counter
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

// 3 bit UP counter

module fsm_counter(
input x,clk,reset_n,en,
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
    s0 : state_next = s1;
    s1 : state_next = s2;
    s2 : state_next = s3;
    s3 : state_next = s4;
    s4 : state_next = s5;
    s5 : state_next = s6;
    s6 : state_next = s7;
    s7 : state_next = s0;
    default : state_next = state_reg;
    endcase
    
    else 
        state_next = state_reg;
end

//output logic
assign num = state_reg;
    
endmodule
