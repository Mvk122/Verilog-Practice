`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 17:14:18
// Design Name: 
// Module Name: stretcher
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

module stretcher(
    input wire fast_clock,
    input wire slow_clock,
    input wire signal_in,
    output reg signal_out,
    output reg enable // Can only stretch 1 signal at a time
);

    reg [7:0] signal_length = 0;
    reg [7:0] signal_output = 0;

    always @ (posedge fast_clock) begin
        if (signal_in) signal_length <= signal_length + 1;
        else if (signal_in == signal_out) signal_length <= 0;
    end

    always @ (posedge slow_clock) begin
        if (signal_length > 0 && signal_output != signal_length) begin
            signal_output <= signal_output + 1;
        end else if (signal_output == signal_length) begin
            signal_output <= 0;
        end else signal_output <= signal_output;
    end

    always @ (*) begin
        // works when signal in can only be 1
        // Will need to cache signal in and do a ternary otherwise
        signal_out = signal_output > 0; 
        enable = !signal_out;
    end

endmodule