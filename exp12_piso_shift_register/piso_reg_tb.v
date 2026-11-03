`timescale 1ns / 1ps

module piso_reg_tb;

    reg        clk = 1'b0;
    reg        rst = 1'b0;
    reg        load_shift = 1'b0;
    reg  [3:0] parallel_in = 4'b0000;
    wire       serial_out;

    parameter clk_period = 10;

    // Instantiate PISO Shift Register
    piso_behavioral #(4) uut (
        .clk(clk),
        .rst(rst),
        .load_shift(load_shift),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock Generator (10 ns period)
    always #(clk_period / 2) clk = ~clk;

    initial begin
        $dumpfile("piso_reg.vcd");
        $dumpvars(0, piso_reg_tb);

        // 1. Reset the circuit
        rst = 1'b1;
        #20;
        rst = 1'b0;
        #7; // Offset to respect setup time and avoid clock edges

        // 2. LOAD MODE
        load_shift = 1'b0;
        parallel_in = 4'b1011; // Load the value 1011
        #clk_period;           // Wait 1 clock cycle for data to lock into the register

        // 3. SHIFT MODE
        load_shift = 1'b1;
        #(4 * clk_period);     // Wait 4 clock cycles to push all bits out

        $finish;
    end

endmodule
