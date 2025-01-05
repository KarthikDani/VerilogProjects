`timescale 1ns / 1ps

module all_sequences_tb;

    // Inputs
    reg clk;
    reg reset;
    reg din;

    // Output
    wire dout;

    // Instantiate the sequence detector (replace `sequence_detector_mealy_non_overlap` with your module)
    sequence_1101_detector_mealy_overlap uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period

     // Test sequence: Generate 4-bit combinations using a single-bit input
    integer i;             // Loop variable
    reg [3:0] pattern;     // Holds the current 4-bit pattern

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        din = 0;

        // Apply reset
        #5 reset = 0;

        // Loop through all 16 possible 4-bit patterns
        for (i = 0; i < 16; i = i + 1) begin
            pattern = i[3:0]; // Extract 4-bit pattern from the integer `i`

            // Feed the 4-bit pattern bit by bit into `din`
            din = pattern[3]; #5; // Most significant bit
            din = pattern[2]; #5; // Next bit
            din = pattern[1]; #5; // Next bit
            din = pattern[0]; #5; // Least significant bit
        end

        // End simulation
        #20 $finish;
    end

    // Dump waveform
    initial begin
        $monitor("Time: %0t | Reset: %b | din: %b | dout: %b | State: %b", $time, reset, din, dout, uut.current_state);
        $dumpfile("all_sequences_tb.vcd"); // Save waveform to VCD file
        $dumpvars(0, all_sequences_tb); // Dump all variables
    end

endmodule
