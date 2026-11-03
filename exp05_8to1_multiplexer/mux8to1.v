// File: mux8to1.v
module mux8to1 (
    input [7:0] D,      // 8-bit data input vector (D7 to D0)
    input [2:0] S,      // 3-bit select input vector (S2, S1, S0)
    output reg Y        // Output must be 'reg' when used inside an always block
);

    // Whenever any input (D or S) changes, this block runs
    always @(*) begin
        case (S)
            3'b000: Y = D[0];
            3'b001: Y = D[1];
            3'b010: Y = D[2];
            3'b011: Y = D[3];
            3'b100: Y = D[4];
            3'b101: Y = D[5];
            3'b110: Y = D[6];
            3'b111: Y = D[7];
            default: Y = 1'b0; // Safe default state
        endcase
    end

endmodule