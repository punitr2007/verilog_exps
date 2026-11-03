`timescale 1ns / 1ps


// 1. Basic 2-Input NAND Gate
module my_nand2 (
    input  wire a,
    input  wire b,
    output wire y
);
    assign y = ~(a & b);
endmodule

// 2. SR Latch (Active-Low Inputs)
module sr_latch_nand (
    input  wire s_bar,
    input  wire r_bar,
    output wire q,
    output wire q_bar
);
    wire q_int, qb_int;

    my_nand2 U1 (.a(s_bar), .b(qb_int), .y(q_int));
    my_nand2 U2 (.a(r_bar), .b(q_int),  .y(qb_int));

    assign q     = q_int;
    assign q_bar = qb_int;

endmodule

// 3. D Latch (Using SR Latch as a component)
module d_latch_nand (
    input  wire d,
    input  wire en,
    output wire q,
    output wire q_bar
);
    wire d_inv, s_n, r_n;

    // Invert D (NAND gate acting as NOT gate)
    my_nand2 U_INV (.a(d),     .b(d),  .y(d_inv));

    // Steering Gates
    my_nand2 U_S   (.a(d),     .b(en), .y(s_n));
    my_nand2 U_R   (.a(d_inv), .b(en), .y(r_n));

    // Core SR Latch
    sr_latch_nand U_SR (
        .s_bar(s_n),
        .r_bar(r_n),
        .q(q),
        .q_bar(q_bar)
    );

endmodule
