// File: mux8to1_tb.v
module mux8to1_tb;

    // Inputs are reg, Output is wire
    reg [7:0] D;
    reg [2:0] S;
    wire Y;

    // Instantiate the 8:1 Mux
    mux8to1 uut (
        .D(D), 
        .S(S), 
        .Y(Y)
    );

    initial begin
        // For GTKWave Output
        $dumpfile("mux8_waveforms.vcd"); 
        $dumpvars(0, mux8to1_tb);

        // Terminal Output Monitor
        $monitor("Time=%0t | Select S=%b | Data D=%b | Output Y=%b", 
                  $time, S, D, Y);

        // Set alternating bits for clear wave testing (10101010)
        D = 8'b10101010; 

        // Test all 8 channels
        S = 3'b000; #10; 
        S = 3'b001; #10; 
        S = 3'b010; #10; 
        S = 3'b011; #10; 
        S = 3'b100; #10; 
        S = 3'b101; #10; 
        S = 3'b110; #10; 
        S = 3'b111; #10; 

        // Dynamic change to prove it updates instantly
        D = 8'b01010101; 
        #10;

        $finish;
    end

endmodule