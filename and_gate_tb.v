`timescale 1ns / 1ps

module and_gate_tb;

    // Testbench variables
    // 'reg' is used for inputs we want to control
    reg test_A;
    reg test_B;

    // 'wire' is used for outputs we want to observe
    wire test_Y;

    // Instantiate the Unit Under Test (UUT)
    // The dots use UPPERCASE to match and_gate.v perfectly
    and_gate uut (
        .A(test_A),
        .B(test_B),
        .Y(test_Y)
    );

    initial begin
        // Setup waveform dumping for GTKWave (optional but highly recommended)
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        // Print a header to the terminal
        $display("Time | A | B | Y");
        $display("----------------");
        
        // $monitor will print the values to the terminal whenever they change
        $monitor("%4t | %b | %b | %b", $time, test_A, test_B, test_Y);

        // Apply test vectors (truth table for AND gate)
        test_A = 0; test_B = 0; #10; // Wait 10 time units
        test_A = 0; test_B = 1; #10;
        test_A = 1; test_B = 0; #10;
        test_A = 1; test_B = 1; #10;

        // End the simulation
        $finish;
    end

endmodule