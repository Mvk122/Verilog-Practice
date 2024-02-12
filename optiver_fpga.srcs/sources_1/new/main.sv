`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 22:32:18
// Design Name: 
// Module Name: main
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

module Demux1to4(
    input logic a, // input signal
    input logic [1:0] s, // select lines
    output logic [3:0] y // output lines
);

    always @ (*) begin
        y = 4'b0000; // default case, all outputs are 0
        case (s)
            2'b00: y[0] = a;
            2'b01: y[1] = a;
            2'b10: y[2] = a;
            2'b11: y[3] = a;
        endcase
    end

endmodule