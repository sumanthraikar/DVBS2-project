`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 15:44:36
// Design Name: 
// Module Name: testbench_scrambler
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


module testbench_scrambler(

    );
    
logic tb_clk;
logic tb_reset;
logic tb_enable;
logic tb_pseudo_random_number;
logic [0:3] tb_pr_n;

scrambler scrambler1(.clk(tb_clk), .reset(tb_reset),.enable(tb_enable), .pr_n(tb_pr_n),.pseudo_random_number(tb_pseudo_random_number));

initial begin
tb_clk=1'b0;
forever #1 tb_clk=~tb_clk;  
end

initial begin
    
    tb_reset = 1'b1;
    tb_enable = 1'b0;
    
    #5;
    tb_reset=1'b0;
    tb_enable=1'b0;
    
    #50;
    tb_reset=1'b0;
    tb_enable = 1'b1;
    
    #10;
    $finish();
    
end

initial begin
    $dumpfile("scrambler_dump.vcd");
    $dumpvars;
end

endmodule
