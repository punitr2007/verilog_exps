// =====================================
// 1. POSITIVE Edge SR Flip-Flop (Behavioral)
// =====================================
module sr_ff (
    input  wire s,
    input  wire r,
    input  wire clk,
    output wire q,
    output wire q_bar
);
    reg q_int = 1'b0; // Initializes to 0

    always @(posedge clk) begin
        if (s == 1'b0 && r == 1'b0)
            q_int <= q_int; // Memory
        else if (s == 1'b1 && r == 1'b0)
            q_int <= 1'b1;  // Set
        else if (s == 1'b0 && r == 1'b1)
            q_int <= 1'b0;  // Reset
        else
            q_int <= 1'bx;  // Invalid State
    end

    assign q     = q_int;
    assign q_bar = ~q_int;

endmodule

// =====================================
// 2. POSITIVE Edge JK Flip-Flop (Behavioral)
// =====================================
module jk_ff (
    input  wire j,
    input  wire k,
    input  wire clk,
    output wire q,
    output wire q_bar
);
    reg q_int = 1'b0; // Initializes to 0

    always @(posedge clk) begin
        if (j == 1'b0 && k == 1'b0)
            q_int <= q_int;    // Memory
        else if (j == 1'b1 && k == 1'b0)
            q_int <= 1'b1;     // Set
        else if (j == 1'b0 && k == 1'b1)
            q_int <= 1'b0;     // Reset
        else if (j == 1'b1 && k == 1'b1)
            q_int <= ~q_int;   // Toggle!
    end

    assign q     = q_int;
    assign q_bar = ~q_int;

endmodule

// Auxiliary: D Flip-Flop (Retained for ISE project compatibility)
module d_ff (
    input  wire clk,
    input  wire d,
    output reg  q,
    output wire q_bar
);
    initial q = 1'b0;

    always @(posedge clk) begin
        q <= d;
    end

    assign q_bar = ~q;

endmodule
