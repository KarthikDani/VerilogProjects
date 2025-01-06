`timescale 1ns / 1ps

module cmp4_tb;
    // Inputs
    reg [3:0] x;  // 4-bit input x
    reg [3:0] y;  // 4-bit input y

    // Outputs
    wire eq;  // Output: 1 if x == y
    wire gt;  // Output: 1 if x > y
    wire lt;  // Output: 1 if x < y

    // Instantiate the Device Under Test (DUT)
    cmp4 dut (
        .x(x),
        .y(y),
        .eq(eq),
        .gt(gt),
        .lt(lt)
    );

    // Stimulus generation
    initial begin
        // Dump the waveform data to a VCD file for visualization
        $dumpfile("cmp4_tb.vcd");
        $dumpvars(0, cmp4_tb);

        // Test all combinations of x and y
        $display("x   | y   | eq | gt | lt");
        $display("-------------------------");

        // Loop through all possible combinations of x and y
        for (integer i = 0; i < 16; i = i + 1) begin
            for (integer j = 0; j < 16; j = j + 1) begin
                x = i;  // Assign value to x
                y = j;  // Assign value to y
                #10;     // Wait for 10 time units
                $display("%b | %b  | %b  | %b  | %b", x, y, eq, gt, lt);
            end
        end

        // End simulation
        $finish;
    end
endmodule
