`timescale 1ns / 1ps

module half_sub_tb; // Changed from half_adder_tb

    // Inputs (reg)
    reg test_a;
    reg test_b;

    // Outputs (wire)
    wire test_diff;
    wire test_borrow;

    // Instantiate the Unit Under Test (UUT)
    half_sub uut (
        .a(test_a),
        .b(test_b),
        .diff(test_diff),
        .borrow(test_borrow)
    );

    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("half_sub.vcd");
        $dumpvars(0, half_sub_tb); // Now perfectly matches the module name

        // Print header and monitor signal changes
        $display("Time | a | b | diff | borrow");
        $display("----------------------------");
        
        // Changed test_sum to test_diff, and test_carry to test_borrow
        $monitor("%4t | %b | %b |   %b  |    %b", $time, test_a, test_b, test_diff, test_borrow);

        // Apply test vectors
        test_a = 0; test_b = 0; #10;
        test_a = 0; test_b = 1; #10;
        test_a = 1; test_b = 0; #10;
        test_a = 1; test_b = 1; #10;

        // End the simulation
        $finish;
    end

endmodule