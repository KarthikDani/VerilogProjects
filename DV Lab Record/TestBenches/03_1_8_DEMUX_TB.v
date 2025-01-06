`timescale 1ns / 1ps

module demux1to8_tb;
    // Inputs
    reg d;          // Single data input
    reg [2:0] s;    // 3-bit select input

    // Outputs
    wire [7:0] y;   // 8 outputs

    // Instantiate the Device Under Test (DUT)
    demux1to8 dut (
        .d(d),
        .s(s),
        .y(y)
    );

    // Task to display output in a tabular format
    task display_table;
        begin
            $display("| Data | Select | Outputs         |");
            $display("|------|--------|-----------------|");
        end
    endtask

    // Stimulus generation
    initial begin
        // Enable dumping to .vcd file
        $dumpfile("demux1to8_tb.vcd"); // Specify the dump file name
        $dumpvars(0, demux1to8_tb);    // Dump all variables in the testbench
        
        // Display the header
        display_table();

        // Iterate through all combinations of `d` and `s`
        for (integer d_i = 0; d_i <= 1; d_i = d_i + 1) begin
            for (integer s_i = 0; s_i < 8; s_i = s_i + 1) begin
                d = d_i;          // Set data input
                s = s_i;          // Set select input
                #10;              // Wait for 10 time units

                // Log the results in tabular form
                $display("|   %b  |  %b   | %b |", d, s, y);
            end
        end

        // End simulation
        $finish;
    end

endmodule
