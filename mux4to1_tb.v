// File: mux4to1_tb.v
module mux4to1_tb;

    reg [3:0] D;
    reg [1:0] S;
    wire Y;

    mux4to1 uut (
        .D(D), 
        .S(S),
        .Y(Y)
    );

    initial begin
        // --- ADD THESE TWO LINES FOR GTKWAVE ---
        $dumpfile("mux4to1.vcd"); 
        $dumpvars(0, mux4to1_tb);
        // ---------------------------------------

        $monitor("Time=%0t | Select S=%b | Data D=%b | Output Y=%b", 
                  $time, S, D, Y);

        D = 4'b1010; 

        S = 2'b00; #10; 
        S = 2'b01; #10; 
        S = 2'b10; #10; 
        S = 2'b11; #10; 

        D = 4'b0010; #10;

        $finish;
    end

endmodule