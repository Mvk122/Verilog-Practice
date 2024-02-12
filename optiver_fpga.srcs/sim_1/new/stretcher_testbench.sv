`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 17:26:05
// Design Name: 
// Module Name: stretcher_testbench
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


module stretcher_testbench();

`define FAST_CLOCK_PERIOD 10
`define SLOW_CLOCK_PERIOD 40
`define MAX_CYCLES 1000

reg fast_clk;
reg slow_clk;

initial fast_clk <= 1;
initial slow_clk <= 1;


always #(`FAST_CLOCK_PERIOD/2) fast_clk <= !fast_clk;
always #(`SLOW_CLOCK_PERIOD/2) slow_clk <= !slow_clk;

initial
begin
repeat (`MAX_CYCLES) @ (posedge fast_clk);
$stop;
end

reg signal_in;
wire signal_out;
wire enable;

stretcher stretcher_module(
    .fast_clock(fast_clk),
    .slow_clock(slow_clk),
    .signal_in(signal_in),
    .signal_out(signal_out),
    .enable(enable)
);

initial
begin
repeat (4) @ (posedge fast_clk);
signal_in = 1; 
repeat (2) @ (posedge fast_clk);
signal_in = 0;
end



endmodule
