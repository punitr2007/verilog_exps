`timescale 1ns / 1ps

module flip_flops_tb;

    reg clk = 1'b0;

    // SR Signals
    reg  s = 1'b0;
    reg  r = 1'b0;
    wire sr_q;
    wire sr_qb;

    // JK Signals
    reg  j = 1'b0;
    reg  k = 1'b0;
    wire jk_q;
    wire jk_qb;

    parameter clk_period = 20;

    // Instantiate SR Flip-Flop
    sr_ff uut_sr (
        .s(s),
        .r(r),
        .clk(clk),
        .q(sr_q),
        .q_bar(sr_qb)
    );

    // Instantiate JK Flip-Flop
    jk_ff uut_jk (
        .j(j),
        .k(k),
        .clk(clk),
        .q(jk_q),
        .q_bar(jk_qb)
    );

    // Clock Generator
    always #(clk_period / 2) clk = ~clk;

    initial begin
        $dumpfile("flip_flops.vcd");
        $dumpvars(0, flip_flops_tb);

        // 3 ns setup time offset
        #3;

        // 1. Test SR Flip-Flop
        s = 1; r = 0; #clk_period; // SET
        s = 0; r = 0; #clk_period; // MEMORY
        s = 0; r = 1; #clk_period; // RESET
        s = 0; r = 0; #clk_period; // MEMORY

        // 2. Test JK Flip-Flop
        j = 1; k = 0; #clk_period; // SET
        j = 0; k = 0; #clk_period; // MEMORY
        j = 0; k = 1; #clk_period; // RESET
        j = 0; k = 0; #clk_period; // MEMORY

        // The Ultimate JK Test: The Toggle State!
        j = 1; k = 1; #(clk_period * 3);

        #400;
        $finish;
    end

endmodule
