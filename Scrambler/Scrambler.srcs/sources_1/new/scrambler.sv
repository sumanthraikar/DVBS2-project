`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Dharwad
// Engineer: Sumanth S Raikar
// 
// Create Date: 25.08.2023 15:32:28
// Design Name: 
// Module Name: scrambler
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


module scrambler(clk, reset, enable, pr_n,pseudo_random_number);
    input logic clk;
    input logic reset;
    input logic enable; // 1- disable the scrambler, 0-enable 
    output logic pseudo_random_number;
    
    
    output logic [0:3] pr_n; 
    
    
   
    always@(posedge clk) begin
       
        if (reset&~enable) pr_n = 4'b1001;//15'b100101010000000; 
        
        else if (enable) pr_n = 4'b0000;
        
        else pr_n = {(pr_n[2]^pr_n[3]), pr_n[0:2]}; 
        
        pseudo_random_number = (pr_n[2]^pr_n[3]);
    end
    
    
    
    
    
endmodule: scrambler 
