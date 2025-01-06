`timescale 1ns / 1ps

module mux8to1_tb;
    // Inputs
    reg [7:0] d;   // Data inputs
    reg [2:0] s;   // Select inputs

    // Output
    wire y;        // Output

    // Instantiate the Device Under Test (DUT)
    mux8to1 dut (
        .d(d),
        .s(s),
        .y(y)
    );

    // Task to display output in a tabular format
    task display_table;
        begin
            $display("| Select | Data Inputs       | Output |");
            $display("|--------|-------------------|--------|");
        end
    endtask

    // Stimulus generation
    initial begin
        // Display the header
        display_table();

        // Iterate through all combinations of `s` and `d`
        for (integer i = 0; i < 8; i = i + 1) begin
            s = i;                // Set select input
            d = 8'b10101010;      // Example data input
            #10;                  // Wait for 10 time units

            // Log the results in tabular form
            $display("|   %b   | %b |   %b   |", s, d, y);
        end

        // End simulation
        $finish;
    end

endmodule
