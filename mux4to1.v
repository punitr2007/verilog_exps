module mux4to1 (
    input [3:0] D,      // 4-bit data input vector
    input [1:0] S,      // 2-bit select input vector
    output Y            // 1-bit output
);

    // Continuous assignment using nested ternary operators
    assign Y = S[1] ? (S[0] ? D[3] : D[2]) : (S[0] ? D[1] : D[0]);

endmodule