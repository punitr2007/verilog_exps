`timescale 1ns / 1ps

module siso_reg_tb;

    reg  clk = 1'b0;
    reg  rst = 1'b0;
    reg  data_in = 1'b0;
    wire data_out;

    parameter clk_period = 10;

    // Instantiate 4-bit SISO Shift Register
    siso_nand uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock Generator
    always #(clk_period / 2) clk = ~clk;

    initial begin
        $dumpfile("siso_reg.vcd");
        $dumpvars(0, siso_reg_tb);

        // 1. Pulse the reset instantly to clear unknown states
        rst = 1'b1;
        #5;
        rst = 1'b0;

        #7; // Aligns stimulus to 12 ns total (safely before the 15 ns clock edge)

        // 2. Input sequence: 1, 0, 1, 1
        data_in = 1'b1; #clk_period;
        data_in = 1'b0; #clk_period;
        data_in = 1'b1; #clk_period;
        data_in = 1'b1; #clk_period;

        // 3. Flush pipeline
        data_in = 1'b0;
        #(6 * clk_period);

        $finish;
    end

endmodule
