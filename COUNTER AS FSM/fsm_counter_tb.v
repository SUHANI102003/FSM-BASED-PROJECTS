`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 19:13:08
// Design Name: 
// Module Name: fsm_counter_tb
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


module fsm_counter_tb(

    );
reg clk,en,reset_n;
wire [2:0] num;

// Instantiate modules

fsm_counter uut0 (
            .clk(clk),
            .en(en),
            .reset_n(reset_n),
            .num(num)
            );

// generate clock
localparam T = 10;           
always        
begin                        
    clk = 1'b1;              
    #(T/2);                  
    clk = 1'b0;              
    #(T/2);                  
end                          
                             
// Generate stimili          
                             
initial                      
begin                        
        reset_n = 1'b0;      
        en = 1'b0;            
        @(negedge clk);      
        reset_n = 1'b1;      
        en = 1'b1;
        
        repeat(20)@(negedge clk);
        $finish;
end                             
endmodule
