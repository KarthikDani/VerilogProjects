`timescale 1ns / 1ps

module decoder2to4_tb;
    // Inputs
    reg [1:0] a;    // 2-bit input
    reg en;          // Enable signal

    // Outputs
    wire [3:0] y;   // 4 outputs

    // Instantiate the Device Under Test (DUT)
    decoder2to4 dut (
        .a(a),
        .en(en),
        .y(y)
    );

    // Task to display output in a tabular format
    task display_table;
        begin
            $display("| Enable | Input a | Outputs        |");
            $display("|--------|---------|----------------|");
        end
    endtask

    // Stimulus generation
    initial begin
        // Enable dumping to .vcd file
        $dumpfile("decoder2to4_tb.vcd"); // Specify the dump file name
        $dumpvars(0, decoder2to4_tb);    // Dump all variables in the testbench
        
        // Display the header
        display_table();

        // Iterate through all combinations of `en` and `a`
        for (integer en_i = 0; en_i <= 1; en_i = en_i + 1) begin
            for (integer a_i = 0; a_i < 4; a_i = a_i + 1) begin
                en = en_i;            // Set enable
                a = a_i;              // Set 2-bit input
                #10;                  // Wait for 10 time units

                // Log the results in tabular form
                $display("|   %b    |   %b    |  %b    |", en, a, y);
            end
        end

        // End simulation
        $finish;
    end

endmodule
