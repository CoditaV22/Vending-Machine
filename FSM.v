`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 09:29:07 PM
// Design Name: 
// Module Name: FSM
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


module FSM(
        input in50 , in100 , reset , clk,
        output give_coffee
    );
    
    localparam state_0b = 3'b000;
    localparam state_50b = 3'b001;
    localparam state_100b = 3'b010;
    localparam state_150b = 3'b011;
    localparam state_200b = 3'b100;
    localparam state_250b = 3'b101;
    localparam state_300b = 3'b110;
    localparam state_350b = 3'b111;
    
    reg [2:0] state , state_next;
    
    always@(posedge clk)
    begin
    if(reset)
    state <= state_0b;
    else
    state <= state_next;
    end
    
    always@(*)
    begin
    state_next = state;
    case(state)
        state_0b: 
            begin
                if(in50) state_next = state_50b;
                if(in100) state_next = state_100b;
            end
          
         state_50b: 
            begin
                if(in50) state_next = state_100b;
                if(in100) state_next = state_150b;
            end
            
         state_100b: 
            begin
                if(in50) state_next = state_150b;
                if(in100) state_next = state_200b;
            end
            
         state_150b: 
            begin
                if(in50) state_next = state_200b;
                if(in100) state_next = state_250b;
            end
            
         state_200b: 
            begin
                if(in50) state_next = state_250b;
                if(in100) state_next = state_300b;
            end
          
         state_250b: 
            begin
                if(in50) state_next = state_300b;
                if(in100) state_next = state_350b;
            end
            
         state_300b: 
            begin
                if(!in50 % !in100) state_next = state_0b;
                if(in50) state_next = state_50b;
                if(in100) state_next = state_100b;
            end                  
          
         state_350b: 
            begin
                if(!in50 % !in100) state_next = state_50b;
                if(in50) state_next = state_100b;
                if(in100) state_next = state_150b;
            end   
            
    endcase
    end
    
    assign give_coffee = (state == state_300b || state == state_350b);
    
endmodule
