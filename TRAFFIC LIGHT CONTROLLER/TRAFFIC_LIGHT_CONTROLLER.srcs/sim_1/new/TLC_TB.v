`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2024 19:14:52
// Design Name: 
// Module Name: TLC_TB
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


module TLC_TB();
reg clk,reset_n;
reg Sa, Sb;
wire  Ga,Gb,Ya,Yb,Ra,Rb;

traffic_light_controller DUT (
        .clk(clk),
        .reset_n(reset_n),
        .Sa(Sa), 
        .Sb(Sb),
        .Ga(Ga),
        .Gb(Gb),
        .Ya(Ya),
        .Yb(Yb),
        .Ra(Ra),
        .Rb(Rb)
        );
        
// To make the output of simulator simpler
// reduce the 6 different outputs to light_A & light_B
//with values R,Y,G
wire [1:0] light_A, light_B;
localparam R = 0;
localparam Y = 1;
localparam G = 2;

assign light_A = Ra ? R : Ya ? Y :Ga ? G : light_A;
assign light_B = Rb ? R : Yb ? Y :Gb ? G : light_B;


initial
#800 $finish;

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
       #2;             
        reset_n = 1'b1;  
        
// no cars at either street 
    Sa = 1'b0; Sb = 1'b0;
// car approaches street B
#80 Sa = 1'b0; Sb = 1'b1;
// cars at both street
#80 Sa = 1'b1; Sb = 1'b1;
// no cars at either street 
#300   Sa = 1'b0; 
#20 Sb = 1'b0;
      
end
endmodule
