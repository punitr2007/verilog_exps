`timescale 1ns / 1ps

module latches_tb;

    // SR Latch Signals
    reg  s_bar = 1'b1;
    reg  r_bar = 1'b1;
    wire sr_q;
    wire sr_qb;

    // D Latch Signals
    reg  d  = 1'b0;
    reg  en = 1'b0;
    wire d_q;
    wire d_qb;

    // Instantiate SR Latch
    sr_latch_nand uut_sr (
        .s_bar(s_bar),
        .r_bar(r_bar),
        .q(sr_q),
        .q_bar(sr_qb)
    );

    // Instantiate D Latch
    d_latch_nand uut_d (
        .d(d),
        .en(en),
        .q(d_q),
        .q_bar(d_qb)
    );

    initial begin
        $dumpfile("latches.vcd");
        $dumpvars(0, latches_tb);

        // Test 1: SR Latch (Active Low)
        s_bar = 1'b0; r_bar = 1'b1; #10; // SET (Q=1)
        s_bar = 1'b1; r_bar = 1'b1; #10; // MEMORY (Holds 1)
        s_bar = 1'b1; r_bar = 1'b0; #10; // RESET (Q=0)
        s_bar = 1'b1; r_bar = 1'b1; #10; // MEMORY (Holds 0)
        s_bar = 1'b0; r_bar = 1'b0; #10; // FORBIDDEN (Both 1)
        s_bar = 1'b0; r_bar = 1'b1; #10; // Recover safely to SET
        s_bar = 1'b1; r_bar = 1'b1; #10; // MEMORY (Holds 1)

        // Test 2: D Latch
        en = 1'b1; d = 1'b1; #10; // Transparent: Q follows D (Q=1)
        en = 1'b1; d = 1'b0; #10; // Transparent: Q follows D (Q=0)
        en = 1'b0; d = 1'b1; #10; // Latch Locked: D changes, Q holds 0
        en = 1'b0; d = 1'b0; #10; // Latch Locked: D changes, Q holds 0
        en = 1'b1; d = 1'b1; #10; // Transparent: Grabs 1 again

        #400;

        $finish;
    end

endmodule
