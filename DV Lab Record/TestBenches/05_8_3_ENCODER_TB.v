`timescale 1ns / 1ps

module encoder8to3_tb;
    // Inputs
    reg [7:0] d;    // 8 input lines
    reg en;          // Enable signal

    // Outputs
    wire [2:0] y;   // 3-bit encoded output

    // Instantiate the Device Under Test (DUT)
    encoder8to3 dut (
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
        $dumpfile("encoder8to3_tb.vcd"); // Specify the dump file name
        $dumpvars(0, encoder8to3_tb);    // Dump all variables in the testbench
        
        // Display the header
        display_table();

        // Iterate through all combinations of `en` and `d`
        for (integer en_i = 0; en_i <= 1; en_i = en_i + 1) begin
            for (integer d_i = 0; d_i < 8; d_i = d_i + 1) begin
                en = en_i;                    // Set enable signal
                d = 1 << d_i;                 // Set single bit active in `d` (one-hot encoding)
                #10;                           // Wait for 10 time units

                // Log the results in tabular form
                $display("|   %b    |  %b    |   %b     |", en, d, y);
            end
        end

        // End simulation
        $finish;
    end

endmodule
