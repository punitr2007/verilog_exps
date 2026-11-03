module comparator_3bit (
    input  wire [2:0] a,
    input  wire [2:0] b,
    output wire       a_gt_b,
    output wire       a_eq_b,
    output wire       a_lt_b
);

    wire x2, x1, x0;

    assign x2 = (a[2] & b[2]) | ~(a[2] | b[2]);
    assign x1 = (a[1] & b[1]) | ~(a[1] | b[1]);
    assign x0 = (a[0] & b[0]) | ~(a[0] | b[0]);

    assign a_eq_b = x2 & x1 & x0;
    assign a_gt_b = (a[2] & ~b[2]) | (x2 & a[1] & ~b[1]) | (x2 & x1 & a[0] & ~b[0]);
    assign a_lt_b = (~a[2] & b[2]) | (x2 & ~a[1] & b[1]) | (x2 & x1 & ~a[0] & b[0]);

endmodule
