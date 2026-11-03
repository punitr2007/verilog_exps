`timescale 1ns / 1ps

module decoder2to4_tb;

    reg  s1;
    reg  s0;
    wire y0;
    wire y1;
    wire y2;
    wire y3;

    decoder2to4 uut (
        .s1(s1),
        .s0(s0),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $dumpfile("decoder2to4.vcd");
        $dumpvars(0, decoder2to4_tb);

        $display("Time | s1 | s0 | y3 | y2 | y1 | y0");
        $display("--------------------------------");
        $monitor("%4t | %b  | %b  | %b  | %b  | %b  | %b", $time, s1, s0, y3, y2, y1, y0);

        s1 = 0; s0 = 0; #10;
        s1 = 0; s0 = 1; #10;
        s1 = 1; s0 = 0; #10;
        s1 = 1; s0 = 1; #10;

        $finish;
    end

endmodule
