module test(
    input int A, B, C,
    input logic X, clk,
    output int S
);

    // Combinatorial calculation of B + C
    wire int add_reg = B + C;

    always @(posedge clk) begin
        if (X == 1) begin
            S <= A;
        end else begin
            // Use the value from add_reg instead of performing the addition operation
            S <= add_reg;
        end
    end
endmodule