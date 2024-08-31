`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 13:15:17
// Design Name: 
// Module Name: mealy_101_detector
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


module mealy_101_detector(
    input x,clk,reset_n,
    output y
    );
 
 reg [1:0] state_next, state_reg;   
 localparam s0 = 0;
 localparam s1 = 1;
 localparam s2 = 2;

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
    s0 : if(x)
            state_next = s1;
         else
             state_next = s0;
    s1 : if(x)
            state_next = s1;
         else
             state_next = s2;
    s2 : if(x)
            state_next = s1;
         else
             state_next = s0;
    default : state_next = state_reg;
    endcase
end

//output logic
assign y = (state_reg == s2) & x;
endmodule
