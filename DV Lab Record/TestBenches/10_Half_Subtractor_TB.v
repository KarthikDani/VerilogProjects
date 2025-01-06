`timescale 1ns / 1ps

module half_subtractor_tb;
    // Inputs
    reg A;            // Minuend input
    reg B;            // Subtrahend input

    // Outputs
    wire Difference;  // Difference output
    wire Borrow;      // Borrow output

    // Instantiate the Device Under Test (DUT)
    half_subtractor dut (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    // Stimulus generation
    initial begin
        // Dump the waveform data to a VCD file for visualization
        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0, half_subtractor_tb);

        // Test all combinations of A and B (00, 01, 10, 11)
        $display("A  | B  | Difference | Borrow");
        $display("-------------------------------");
        
        // Loop through all possible combinations of A and B
        for (integer i = 0; i < 4; i = i + 1) begin
            A = i[1];  // Assign bit 1 of i to A (MSB)
            B = i[0];  // Assign bit 0 of i to B (LSB)
            #10;        // Wait for 10 time units
            $display("%b  | %b  |     %b     |   %b", A, B, Difference, Borrow);
        end

        // End simulation
        $finish;
    end
endmodule
