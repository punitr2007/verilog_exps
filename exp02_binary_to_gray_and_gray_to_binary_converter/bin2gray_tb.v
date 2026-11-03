`timescale 1ns / 1ps

module bin2gray_tb;

    // 4-bit registers and wires
    reg [3:0] test_bin;
    wire [3:0] test_gray;
    
    // Integer for the loop
    integer i; 

    // Instantiate the converter
    bin2gray uut (
        .bin(test_bin),
        .gray(test_gray)
    );

    initial begin
        $dumpfile("bin2gray.vcd");
        $dumpvars(0, bin2gray_tb);

        $display("Time | Binary | Gray");
        $display("--------------------");
        $monitor("%4t |  %4b  | %4b", $time, test_bin, test_gray);

        // Loop through all 16 binary combinations (0 to 15)
        for (i = 0; i < 16; i = i + 1) begin
            test_bin = i;
            #10; // Wait 10 time units between changes
        end

        $finish;
    end
endmodule