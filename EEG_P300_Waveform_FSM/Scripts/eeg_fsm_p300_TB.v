module testbench;
    reg clk;                  
    reg reset;                
    reg [7:0] eeg_signal;     
    wire detected;

    eeg_fsm_p300 uut (
        .clk(clk),
        .reset(reset),
        .eeg_signal(eeg_signal),
        .detected(detected)
    );

    always begin
        #1 clk = ~clk; // #1 for half-period
    end

    // Test cases --------------
    initial begin
        clk = 0;
        reset = 1;
        eeg_signal = 8'd50;
        #10 reset = 0;      // reset after some time

        $display("Test Case 1: Timeout scenario");
        #10 eeg_signal = 8'd55; // Rising phase
        #550 eeg_signal = 8'd75; // Peak occurs too late
        #20 eeg_signal = 8'd65;  // Falling phase
        #20 eeg_signal = 8'd51;  // Back to baseline
        #20 if (!detected) $display("P300 Timeout: PASS");
            else $display("P300 Timeout: FAIL");

        $display("Test Case 2: False positive prevention");
        #20 eeg_signal = 8'd55; // Rising
        #20 eeg_signal = 8'd60; // No actual peak (threshold not met)
        #20 eeg_signal = 8'd50; // Back to baseline
        #20 if (!detected) $display("No False Positive: PASS");
            else $display("No False Positive: FAIL");

        $display("Test Case 3: Valid P300 pattern");
        #20 eeg_signal = 8'd55; // Rising phase
        #20 eeg_signal = 8'd75; // Peak phase
        #20 eeg_signal = 8'd59; // Falling phase
        #20 eeg_signal = 8'd50; // Back to baseline
        #20 if (detected) $display("P300 Detected: PASS");
            else $display("P300 Detected: FAIL");

        #50 $finish;
    end

    // Dump waveforms for simulation (VCD)
    initial begin
        $dumpfile("eeg_fsm_p300.vcd");
        $dumpvars(0, testbench);
    end

endmodule