`timescale 1ns / 1ps

module priority_encoder8to3_tb;
    // Inputs
    reg [7:0] d;    // 8 input lines
    reg en;          // Enable signal

    // Outputs
    wire [2:0] y;   // 3-bit encoded output

    // Instantiate the Device Under Test (DUT)
    priority_encoder8to3 dut (
        .d(d),
        .en(en),
        .y(y)
    );

    // Task to display output in a tabular format
    task display_table;
        begin
            $display("| Enable | Input d      | Encoded Output |");
            $display("|--------|--------------|-----------------|");
        end
    endtask

    // Stimulus generation
    initial begin
        // Enable dumping to .vcd file
        $dumpfile("priority_encoder8to3_tb.vcd"); // Specify the dump file name
        $dumpvars(0, priority_encoder8to3_tb);    // Dump all variables in the testbench
        
        // Display the header
        display_table();

        // Test with Enable signal en = 0
        en = 0;
        for (integer i = 0; i < 8; i = i + 1) begin
            d = (1 << i);  // Set single bit active in `d` (one-hot encoding)
            #10;           // Wait for 10 time units
            $display("|   %b    |  %b    |   %b     |", en, d, y);
        end

        // Test with Enable signal en = 1
        en = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            d = (1 << i);  // Set single bit active in `d` (one-hot encoding)
            #10;           // Wait for 10 time units
            $display("|   %b    |  %b    |   %b     |", en, d, y);
        end

        // Test with all `d` values (combinations of 8-bit values)
        en = 1;
        for (integer j = 0; j < 256; j = j + 1) begin
            d = j;         // Iterate through all 8-bit combinations
            #10;           // Wait for 10 time units
            $display("|   %b    |  %b    |   %b     |", en, d, y);
        end

        // End simulation
        $finish;
    end
endmodule
