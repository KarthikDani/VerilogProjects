`timescale 1ns / 1ps

module targeted_sequences_tb;

    reg clk, reset, din;
    wire dout;

    // Instantiate the sequence detector
    sequence_1011_detector_moore_non_overlap uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        din = 0;

        // Apply reset
        #5 reset = 0;

        // Test sequence
        #5 din = 1; 
        #5 din = 1;
        #5 din = 0; 
        #5 din = 1; 
        #5 din = 1;  
        #5 din = 0; 
        #5 din = 1; 

        #5 din = 1; 
        #5 din = 1; 
        #5 din = 0;  
        #5 din = 1;
        #5 din = 1; 
        #5 din = 1; 
        #5 din = 0; 
        #5 din = 1; 

        // End simulation
        #200 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Reset: %b | din: %b | dout: %b | State: %b", $time, reset, din, dout, uut.current_state);
        $dumpfile("targeted_sequences_tb.vcd");
        $dumpvars(0, targeted_sequences_tb);
    end

endmodule
