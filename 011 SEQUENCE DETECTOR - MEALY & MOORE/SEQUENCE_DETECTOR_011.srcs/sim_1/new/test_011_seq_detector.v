`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 10:31:27
// Design Name: 
// Module Name: test_011_seq_detector
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


module test_011_seq_detector();

reg clk,reset_n,x;           
wire y_mealy, y_moore, y_moore_3ff;
                             
// Instantiate all the 011 se
                             
mealy_011_seq_detector DUT ( 
            .clk(clk),       
            .reset_n(reset_n),
            .x(x),           
            .y(y_mealy)      
);                           
                             
moore_011_seq_detector DUT1 (
            .clk(clk),       
            .reset_n(reset_n),
            .x(x),           
            .y(y_moore)      
); 
                         
                          
moore_3ff_011_seq_detect DUT2 (
            .clk(clk),       
            .reset_n(reset_n),
            .x(x),           
            .y(y_moore_3ff)  
);                           
                            
// Generating clk signal     
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
                             
        x = 1'b1;            
     #T x = 1'b0;            
     #T x = 1'b1;            
     #T x = 1'b0;            
     #T x = 1'b0;            
     #T x = 1'b0;            
     #T x = 1'b1;            
     #T x = 1'b1;            
     #T x = 1'b1;            
     #T x = 1'b1;            
     #T x = 1'b1;            
     #T x = 1'b0;            
     #T x = 1'b0;            
     #T x = 1'b0;            
     #T x = 1'b1; 
     #T x = 1'b1;    
     #T x = 1'b1;    
     #T x = 1'b1;    
     #T x = 1'b0;
     #T x = 1'b1;    
     #T x = 1'b0;    
     #T x = 1'b1;                   
     #T $finish;             
                             
end                          
endmodule                    

    
