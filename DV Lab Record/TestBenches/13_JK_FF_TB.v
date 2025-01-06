`timescale 1ns / 1ps

module jk_flip_flop_tb;
    // Inputs
    reg J, K, clk, rst;

    // Outputs
    wire Q, Qbar;

    // Instantiate the JK flip-flop (Device Under Test)
    jk_flip_flop dut (
        .J(J),
        .K(K),
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
        J = 0;
        K = 0;

        // Initialize VCD file for waveform dump
        $dumpfile("jk_flip_flop_tb.vcd");
        $dumpvars(0, jk_flip_flop_tb);  // Dump all signals in the testbench

        // Display header for clarity
        $display("Time | J | K | Q | Qbar | rst | clk");
        $display("------------------------------------");

        // Apply Reset (rst) and observe behavior
        rst = 1;  // Assert reset
        #10 rst = 0;  // Deassert reset

        // Test 1: J=0, K=0 (No change)
        J = 0; K = 0;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // Test 2: J=0, K=1 (Reset Q to 0)
        J = 0; K = 1;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // Test 3: J=1, K=0 (Set Q to 1)
        J = 1; K = 0;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // Test 4: J=1, K=1 (Toggle Q)
        J = 1; K = 1;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // Test 5: Apply Reset while J=0, K=0
        rst = 1;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // Test 6: Remove reset and observe state with J=1, K=1 (Toggle Q)
        rst = 0;
        J = 1; K = 1;
        #10;
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, J, K, Q, Qbar, rst, clk);

        // End simulation
        $finish;
    end
endmodule
