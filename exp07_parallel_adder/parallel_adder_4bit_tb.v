`timescale 1ns / 1ps

module parallel_adder_4bit_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    parallel_adder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("parallel_adder.vcd");
        $dumpvars(0, parallel_adder_4bit_tb);

        $display("Time | a    | b    | cin | sum  | cout");
        $monitor("%4t | %4b | %4b |  %b  | %4b |  %b", $time, a, b, cin, sum, cout);

        a = 4'b0000; b = 4'b0000; cin = 1'b0; #10;
        a = 4'b0101; b = 4'b0011; cin = 1'b0; #10;
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #10;
        a = 4'b0111; b = 4'b0111; cin = 1'b1; #10;

        $finish;
    end

endmodule
