`timescale 1ns / 1ps

module comparator_3bit_tb;

    reg  [2:0] a;
    reg  [2:0] b;
    wire       a_gt_b;
    wire       a_eq_b;
    wire       a_lt_b;

    comparator_3bit uut (
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_eq_b(a_eq_b),
        .a_lt_b(a_lt_b)
    );

    initial begin
        $dumpfile("comparator_3bit.vcd");
        $dumpvars(0, comparator_3bit_tb);

        $display("Time | a   | b   | a>b | a=b | a<b");
        $monitor("%4t | %3b | %3b |  %b  |  %b  |  %b", $time, a, b, a_gt_b, a_eq_b, a_lt_b);

        a = 3'b000; b = 3'b000; #10;
        a = 3'b101; b = 3'b011; #10;
        a = 3'b010; b = 3'b110; #10;
        a = 3'b111; b = 3'b111; #10;
        a = 3'b100; b = 3'b001; #10;

        $finish;
    end

endmodule
