`timescale 1ns / 1ps

module mux2to1_tb;
    // Inputs
    reg [1:0] d;   // Data inputs
    reg s;         // Select input
    reg en;        // Enable signal

    // Output
    wire y;        // Output

    // Instantiate the Device Under Test (DUT)
    mux2to1 dut (
        .d(d),
        .s(s),
        .en(en),
        .y(y)
    );

    // Task to display output in a tabular format
    task display_table;
        begin
            $display("| Enable | Select | Data Inputs | Output |");
            $display("|--------|--------|-------------|--------|");
        end
    endtask

    // Stimulus generation
    initial begin
        // Enable dumping to .vcd file
        $dumpfile("mux2to1_tb.vcd"); // Specify the dump file name
        $dumpvars(0, mux2to1_tb);    // Dump all variables in the testbench
        
        // Display the header
        display_table();

        // Iterate through all combinations of `en`, `s`, and `d`
        for (integer en_i = 0; en_i <= 1; en_i = en_i + 1) begin
            for (integer s_i = 0; s_i <= 1; s_i = s_i + 1) begin
                for (integer d_i = 0; d_i < 4; d_i = d_i + 1) begin
                    en = en_i;           // Set enable
                    s = s_i;             // Set select input
                    d = d_i;             // Set data inputs
                    #10;                 // Wait for 10 time units

                    // Log the results in tabular form
                    $display("|   %b    |   %b    |    %b     |   %b    |", en, s, d, y);
                end
            end
        end

        // End simulation
        $finish;
    end

endmodule
