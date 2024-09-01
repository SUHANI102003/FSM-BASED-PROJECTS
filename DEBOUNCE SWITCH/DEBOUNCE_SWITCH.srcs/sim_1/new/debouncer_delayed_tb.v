`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 11:34:43
// Design Name: 
// Module Name: debouncer_delayed_tb
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


module debouncer_delayed_tb();

reg reset_n;
reg clk;
reg noisy;
wire debounce;
integer i;

debouncer_delayed DUT (
              .clk(clk),
              .reset_n(reset_n),
              .noisy(noisy),
              .debounce(debounce)
 );

    
 // generate clk signal
 localparam T = 10;       //  10 ns
 always
 begin
    clk = 1'b0;
    #(T/2);
     clk = 1'b1;
    #(T/2); 
 end   
 
 localparam DELAY = 50_000_000;  // 50 ms delay
 
 
 initial
 begin
 // a quick reset for 2ns
       reset_n = 1'b0;
       noisy = 1'b0;
    #2 reset_n = 1'b1;
     
     repeat(2) @(negedge clk);
        noisy = 1'b1;
        
        #(DELAY);
        noisy = 1'b0;
        
        #(DELAY);
        
        repeat(20) @(negedge clk);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2);
        noisy = ~noisy;
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
                    
        #(DELAY/2);
        noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 6; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2) noisy = 1'b0;                                                
        #(DELAY) $stop;
        
    end        
endmodule
