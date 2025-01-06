`timescale 1ns / 1ps

module d_flip_flop_tb;
    // Inputs
    reg D, clk, rst;

    // Outputs
    wire Q, Qbar;

    // Instantiate the D flip-flop (Device Under Test)
    d_flip_flop dut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5ns (100MHz clock)

    // Stimulus generation
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        D = 0;

        // Initialize VCD file for waveform dump
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);  // Dump all signals in the testbench

        // Display header for clarity
        $display("Time | D | Q | Qbar | rst | clk");
        $display("-----------------------------------");

        // Apply Reset (rst) and observe behavior
        rst = 1;  // Assert reset
        #10 rst = 0;  // Deassert reset

        // Test 1: Set D = 1 and observe behavior
        D = 1;
        #10;  // Check if Q becomes 1
        $display("%0t | %b | %b | %b | %b | %b", $time, D, Q, Qbar, rst, clk);

        // Test 2: Set D = 0 and observe behavior
        D = 0;
        #10;  // Check if Q becomes 0
        $display("%0t | %b | %b | %b | %b | %b", $time, D, Q, Qbar, rst, clk);

        // Test 3: Apply reset while D = 1
        D = 1;
        rst = 1;
        #10;  // Check if Q becomes 0 after reset
        $display("%0t | %b | %b | %b | %b | %b", $time, D, Q, Qbar, rst, clk);

        // Test 4: Remove reset and check D = 0 state
        rst = 0;
        #10;  // Check if Q stays 0
        $display("%0t | %b | %b | %b | %b | %b", $time, D, Q, Qbar, rst, clk);

        // Test 5: Set D = 1 and observe Q behavior
        D = 1;
        #10;  // Check if Q becomes 1 again
        $display("%0t | %b | %b | %b | %b | %b", $time, D, Q, Qbar, rst, clk);

        // End simulation
        $finish;
    end
endmodule
