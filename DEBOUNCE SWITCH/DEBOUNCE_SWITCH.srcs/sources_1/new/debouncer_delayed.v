`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 11:22:27
// Design Name: 
// Module Name: debouncer_delayed
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


module debouncer_delayed(
input clk,reset_n,
input noisy,
output debounce
    );
    
wire timer_done, timer_reset;

debouncer_delayed_fsm FSM0 (
    .clk(clk),
    .reset_n(reset_n),
    .noisy(noisy),
    .debounce(debounce),
    .timer_reset(timer_reset),
    .timer_done(timer_done));

// 20 ms as timer    
timer_parameter #(.MOD(1_999_999)) T0(
    .clk(clk),
    .reset_n(~timer_reset),
    .enable(~timer_reset),
    .done(timer_done));
endmodule
