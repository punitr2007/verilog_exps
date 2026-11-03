module bin2gray (
    input wire [3:0] bin,
    output wire [3:0] gray
);

    // Bitwise XOR between the binary number and itself shifted right by 1
    assign gray = bin ^ (bin >> 1);

endmodule