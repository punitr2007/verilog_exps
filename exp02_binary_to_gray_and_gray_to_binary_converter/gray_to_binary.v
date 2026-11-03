module gray_to_binary (
    input  wire [3:0] g,  // 4-bit Gray code input
    output wire [3:0] b   // 4-bit Binary code output
);

    assign b[3] = g[3];
    assign b[2] = b[3] ^ g[2];
    assign b[1] = b[2] ^ g[1];
    assign b[0] = b[1] ^ g[0];

endmodule