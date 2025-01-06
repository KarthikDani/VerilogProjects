`timescale 1ns / 1ps

module bin_to_gray_tb;
    // Inputs
    reg [3:0] b;  // 4-bit binary input

    // Outputs
    wire [3:0] g; // 4-bit Gray code output

    // Instantiate the Device Under Test (DUT)
    bin_to_gray dut (
        .b(b),
        .g(g)
    );

    // Stimulus generation
    initial begin
        // Dump the waveform data to a VCD file for visualization
        $dumpfile("bin_to_gray_tb.vcd");
        $dumpvars(0, bin_to_gray_tb);

        // Test all combinations of b (from 0 to 15)
        $display("b   | g   ");
        $display("----------------");
        
        // Loop through all possible combinations of b
        for (integer i = 0; i < 16; i = i + 1) begin
            b = i;  // Assign value to b
            #10;     // Wait for 10 time units
            $display("%b  | %b", b, g);
        end

        // End simulation
        $finish;
    end
endmodule
