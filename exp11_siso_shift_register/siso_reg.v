`timescale 1ns / 1ps

// ============================================================================
// Experiment 11: 4-bit SISO Shift Register (Structural NAND Implementation)
// ============================================================================

// 2-Input NAND
module my_nand2 (
    input  wire a,
    input  wire b,
    output wire y
);
    assign y = ~(a & b);
endmodule

// 3-Input NAND (Required to force the reset state)
module my_nand3 (
    input  wire a,
    input  wire b,
    input  wire c,
    output wire y
);
    assign y = ~(a & b & c);
endmodule

// D-Latch with Asynchronous Active-Low Reset (rst_bar)
module d_latch_nand (
    input  wire d,
    input  wire en,
    input  wire rst_bar,
    output wire q,
    output wire q_bar
);
    wire d_inv, n1, n2, q_int, qb_int;

    my_nand2 U1 (.a(d),     .b(d),       .y(d_inv));
    my_nand3 U2 (.a(d),     .b(en),      .c(rst_bar), .y(n1));
    my_nand2 U3 (.a(d_inv), .b(en),      .y(n2));
    my_nand2 U4 (.a(n1),    .b(qb_int),  .y(q_int));
    my_nand3 U5 (.a(n2),    .b(q_int),   .c(rst_bar), .y(qb_int));

    assign q     = q_int;
    assign q_bar = qb_int;

endmodule

// Master-Slave D-Flip-Flop with Reset
module d_ff_nand (
    input  wire clk,
    input  wire d,
    input  wire rst,
    output wire q
);
    wire clk_inv, rst_bar, master_q, master_qb, slave_qb;

    my_nand2 U_CLK_INV (.a(clk), .b(clk), .y(clk_inv));
    my_nand2 U_RST_INV (.a(rst), .b(rst), .y(rst_bar));

    // Master Latch (transparent when clk=0, holds when clk=1)
    d_latch_nand MASTER (
        .d(d),
        .en(clk_inv),
        .rst_bar(rst_bar),
        .q(master_q),
        .q_bar(master_qb)
    );

    // Slave Latch (holds when clk=0, transparent when clk=1)
    d_latch_nand SLAVE (
        .d(master_q),
        .en(clk),
        .rst_bar(rst_bar),
        .q(q),
        .q_bar(slave_qb)
    );

endmodule

// Top Level: 4-bit SISO Shift Register (Structural)
module siso_nand (
    input  wire clk,
    input  wire rst,
    input  wire data_in,
    output wire data_out
);
    wire q0, q1, q2, q3;

    d_ff_nand FF1 (.clk(clk), .d(data_in), .rst(rst), .q(q0));
    d_ff_nand FF2 (.clk(clk), .d(q0),      .rst(rst), .q(q1));
    d_ff_nand FF3 (.clk(clk), .d(q1),      .rst(rst), .q(q2));
    d_ff_nand FF4 (.clk(clk), .d(q2),      .rst(rst), .q(q3));

    assign data_out = q3;

endmodule

// Top Level Wrapper for Xilinx ISE Project Compatibility
module siso_reg (
    input  wire clk,
    input  wire rst,
    input  wire data_in,
    output wire data_out
);
    siso_nand uut_core (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );
endmodule
