`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 09:38:44 PM
// Design Name: 
// Module Name: tb
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


module tb();

reg clk , reset , in50 , in100;
wire give_coffee;

initial
begin
clk = 0;
forever #1 clk = ~clk;
end

initial
begin
reset <= 1;
in50 <= 0;
in100 <= 0;

#6  reset <= 0;
    in50 <= 1;
#4 in50 <=0;
   in100 <= 1;
#20 in50 <=1;
    in100 <= 0;
    
#15 $stop();
end

FSM DUT
(
    .clk(clk),
    .reset(reset),
    .in50(in50),
    .in100(in100),
    .give_coffee(give_coffee)
);


endmodule
