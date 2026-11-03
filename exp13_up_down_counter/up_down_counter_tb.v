`timescale 1ns / 1ps

module up_down_counter_tb;

    reg        clk = 1'b0;
    reg        rst = 1'b0;
    reg        up_down = 1'b1;
    wire [3:0] count;

    parameter clk_period = 10;

    // Instantiate 4-bit Up-Down Counter
    up_down_counter #(4) uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock Generator (10 ns period)
    always #(clk_period / 2) clk = ~clk;

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, up_down_counter_tb);

        // 1. Apply Reset
        rst = 1'b1;
        #20;
        rst = 1'b0;
        #7; // Offset for setup time

        // 2. Count UP for 5 clock cycles
        up_down = 1'b1;
        #(5 * clk_period);

        // 3. Switch to count DOWN for 8 clock cycles
        up_down = 1'b0;
        #(8 * clk_period);

        // 4. Switch back to count UP for 3 clock cycles
        up_down = 1'b1;
        #(3 * clk_period);

        $finish;
    end

endmodule
