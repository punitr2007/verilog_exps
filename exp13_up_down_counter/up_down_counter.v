`timescale 1ns / 1ps

// ============================================================================
// Experiment 13: 4-bit Up-Down Counter (Behavioral)
// ============================================================================

module up_down_counter #(
    parameter N = 4
)(
    input  wire         clk,
    input  wire         rst,
    input  wire         up_down, // 1 = Count UP, 0 = Count DOWN
    output wire [N-1:0] count
);
    // Internal register for counting (mirrors VHDL internal_count : unsigned)
    reg [N-1:0] internal_count = {N{1'b0}};

    always @(posedge clk or posedge rst) begin
        // Asynchronous Reset
        if (rst) begin
            internal_count <= {N{1'b0}};
        end else begin
            // Check the control pin and count accordingly
            if (up_down == 1'b1)
                internal_count <= internal_count + 1'b1;
            else
                internal_count <= internal_count - 1'b1;
        end
    end

    // Output assignment
    assign count = internal_count;

endmodule
