`timescale 1ns / 1ps

module half_adder_tb;

    // Inputs (reg)
    reg test_a;
    reg test_b;

    // Outputs (wire)
    wire test_sum;
    wire test_carry;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(test_a),
        .b(test_b),
        .sum(test_sum),
        .carry(test_carry)
    );

    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        // Print header and monitor signal changes
        $display("Time | a | b | sum | carry");
        $display("--------------------------");
        $monitor("%4t | %b | %b |  %b  |   %b", $time, test_a, test_b, test_sum, test_carry);

        // Apply test vectors
        test_a = 0; test_b = 0; #10;
        test_a = 0; test_b = 1; #10;
        test_a = 1; test_b = 0; #10;
        test_a = 1; test_b = 1; #10;

        // End the simulation
        $finish;
    end

endmodule