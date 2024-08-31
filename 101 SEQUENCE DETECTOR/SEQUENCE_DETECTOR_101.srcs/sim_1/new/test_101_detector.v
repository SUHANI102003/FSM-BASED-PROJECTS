`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 13:43:02
// Design Name: 
// Module Name: test_101_detector
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


module test_101_detector();
reg clk,x,reset_n;
wire y_moore, y_mealy;

// Instantiate modules

mealy_101_detector uut0 (
            .clk(clk),
            .x(x),
            .reset_n(reset_n),
            .y(y_mealy)
            );
            
moore_101_detector uut1 (
            .clk(clk),
            .x(x),
            .reset_n(reset_n),
            .y(y_moore)
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
        x = 1'b0;            
        @(negedge clk);      
        reset_n = 1'b1;      
                                        
          x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #2  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;      
     #T $finish;             
                             
end                         
endmodule
