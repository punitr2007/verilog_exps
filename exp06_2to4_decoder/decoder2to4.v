module decoder2to4 (
    input  wire s1,
    input  wire s0,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3
);

    assign y0 = ~s1 & ~s0;
    assign y1 = ~s1 &  s0;
    assign y2 =  s1 & ~s0;
    assign y3 =  s1 &  s0;

endmodule
