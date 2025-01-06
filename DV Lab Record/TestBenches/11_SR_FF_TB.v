`timescale 1ns / 1ps

module sr_flip_flop_tb;
    // Inputs
    reg S, R, clk, rst;

    // Outputs
    wire Q, Qbar;

    // Instantiate the SR flip-flop (Device Under Test)
    sr_flip_flop dut (
        .S(S),
        .R(R),
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
        S = 0;
        R = 0;

        // Display header for clarity
        $display("Time | S | R | Q | Qbar | rst | clk");
        $display("----------------------------------------");

        // Apply Reset (rst) and observe behavior
        rst = 1;  // Assert reset
        #10 rst = 0;  // Deassert reset, check for Q = 0 after reset

        // Test 1: No Change Condition (S = 0, R = 0)
        S = 0; R = 0;
        #10;  // Observe if Q retains its value
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);
        
        // Test 2: Set Condition (S = 1, R = 0)
        S = 1; R = 0;
        #10;  // Check if Q is set to 1
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);

        // Test 3: Reset Condition (S = 0, R = 1)
        S = 0; R = 1;
        #10;  // Check if Q is reset to 0
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);

        // Test 4: Invalid Condition (S = 1, R = 1)
        S = 1; R = 1;
        #10;  // Check if Q goes to 'x' (undefined state)
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);

        // Test 5: No Change Condition (S = 0, R = 0)
        S = 0; R = 0;
        #10;  // Observe if Q retains its value after invalid state
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);
        
        // Test 6: Set Condition again (S = 1, R = 0)
        S = 1; R = 0;
        #10;  // Check if Q is set to 1 again
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);

        // Test 7: Reset Condition again (S = 0, R = 1)
        S = 0; R = 1;
        #10;  // Check if Q is reset to 0 again
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);
        
        // Test 8: Final invalid case (S = 1, R = 1)
        S = 1; R = 1;
        #10;  // Check if Q goes to 'x' (undefined state)
        $display("%0t | %b | %b | %b | %b | %b | %b", $time, S, R, Q, Qbar, rst, clk);

        // End simulation
        $finish;
    end
endmodule
