`timescale 1ns / 1ps

// ============================================================================
// Experiment 12: Parallel-In Serial-Out (PISO) Shift Register (Behavioral)
// ============================================================================

module piso_behavioral #(
    parameter N = 4
)(
    input  wire         clk,
    input  wire         rst,
    input  wire         load_shift,  // 0 = Load Parallel Data, 1 = Shift Right
    input  wire [N-1:0] parallel_in,
    output wire         serial_out
);
    reg [N-1:0] shift_reg = {N{1'b0}};

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= {N{1'b0}};
        end else begin
            if (load_shift == 1'b0) begin
                // LOAD MODE: Grab all N bits simultaneously
                shift_reg <= parallel_in;
            end else begin
                // SHIFT MODE (Left to Right)
                // Pad a 0 on the left side and push the right-most bit out
                shift_reg <= {1'b0, shift_reg[N-1:1]};
            end
        end
    end

    // Serial output is tapped from the right-most bit (LSB)
    assign serial_out = shift_reg[0];

endmodule

// Module alias for Xilinx ISE Project Compatibility
module piso_reg #(
    parameter N = 4
)(
    input  wire         clk,
    input  wire         rst,
    input  wire         load_shift,
    input  wire [N-1:0] parallel_in,
    output wire         serial_out
);
    piso_behavioral #(N) uut (
        .clk(clk),
        .rst(rst),
        .load_shift(load_shift),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );
endmodule
