`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 17:12:45
// Design Name: 
// Module Name: button
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


module button(
input clk, reset_n,
input noisy,
output debounce,
output p_edge, n_edge,_edge    );

debouncer_delayed DD0(
    .clk(clk),
    .reset_n(reset_n),
    .noisy(noisy),
    .debounce(debounce));
    
edge_detector ED0(
    .clk(clk),
    .reset_n(reset_n),
    .level(debounce),
    .p_edge(p_edge),
    .n_edge(n_edge),
    ._edge(_edge)
    );
endmodule
