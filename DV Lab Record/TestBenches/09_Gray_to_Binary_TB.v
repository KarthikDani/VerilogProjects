`timescale 1ns / 1ps

module gray_to_bin_tb;
    // Inputs
    reg [3:0] g;  // 4-bit Gray code input

    // Outputs
    wire [3:0] b; // 4-bit binary output

    // Instantiate the Device Under Test (DUT)
    gray_to_bin dut (
        .g(g),
        .b(b)
    );

    // Stimulus generation
    initial begin
        // Dump the waveform data to a VCD file for visualization
        $dumpfile("gray_to_bin_tb.vcd");
        $dumpvars(0, gray_to_bin_tb);

        // Test all combinations of g (from 0 to 15)
        $display("g   | b   ");
        $display("----------------");
        
        // Loop through all possible combinations of g
        for (integer i = 0; i < 16; i = i + 1) begin
            g = i;  // Assign value to g
            #10;     // Wait for 10 time units
            $display("%b  | %b", g, b);
        end

        // End simulation
        $finish;
    end
endmodule
