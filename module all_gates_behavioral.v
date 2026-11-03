module all_gates_behavioral (
    input  wire a,
    input  wire b,
    output reg  y_not,
    output reg  y_and,
    output reg  y_or,
    output reg  y_nand,
    output reg  y_nor,
    output reg  y_xor,
    output reg  y_xnor
);

    always @(*) begin
        y_not  = ~a;
        y_and  = a & b;
        y_or   = a | b;
        y_nand = ~(a & b);
        y_nor  = ~(a | b);
        y_xor  = a ^ b;
        y_xnor = ~(a ^ b);
    end

endmodule