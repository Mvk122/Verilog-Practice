`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 22:34:27
// Design Name: 
// Module Name: testbench
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


module testbench();
reg a = 1;
reg [1:0] s = 0;
wire [3:0] y;

Demux1to4 demuxer(
    .a(a),
    .s(s),
    .y(y)
);

`define CLOCK_PERIOD   10
`define MAX_CYCLES     500

reg          clk;
initial clk <= 1;			// Define the clock
always #(`CLOCK_PERIOD/2) clk <= !clk;

initial					// Limit the simulation run
begin
repeat (`MAX_CYCLES) @ (posedge clk);	// Count off so many clock edges ...
$stop;					// ... then terminate
end

initial
begin

s = 0;
repeat(4) @ (posedge clk);
s = 1;
repeat(4) @ (posedge clk);
s = 3;
repeat(4) @ (posedge clk);
s = 2;
end


endmodule
