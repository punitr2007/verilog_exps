module gray_to_binary_tb;


    reg  [3:0] test_g;
    wire [3:0] test_b;

    integer i;

        gray_to_binary uut (
        .g(test_g),
        .b(test_b)
    );

    initial begin
        
        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0, gray_to_binary_tb);

    
         $display("---------------------------------------");
        $display("Time (ns) | Gray Input | Binary Output");
        $display("---------------------------------------");
        $monitor("%8t  |    %4b    |     %4b", $time, test_g, test_b);


        for (i = 0; i < 16; i = i + 1) begin
            test_g = i[3:0];
            #10;
        end

        $display("---------------------------------------");
        $display("Simulation completed successfully.");
        $finish;
    end

endmodule