module all_gates_structural (
    input  wire a,
    input  wire b,
    output wire y_not,
    output wire y_and,
    output wire y_or,
    output wire y_nand,
    output wire y_nor,
    output wire y_xor,
    output wire y_xnor
);

    // Syntax: gate_type instance_name (output, input1, input2, ...);
    not  g1 (y_not, a);
    and  g2 (y_and, a, b);
    or   g3 (y_or, a, b);
    nand g4 (y_nand, a, b);
    nor  g5 (y_nor, a, b);
    xor  g6 (y_xor, a, b);
    xnor g7 (y_xnor, a, b);

endmodule