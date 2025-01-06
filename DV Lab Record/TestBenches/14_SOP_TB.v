`timescale 1ns / 1ps

module sop_circuit_tb;
    // Inputs
    reg A, B, C, D;

    // Outputs
    wire F;

    // Instantiate the SOP circuit (Device Under Test)
    sop_circuit dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F)
    );

    // Create the VCD file
    initial begin
        $dumpfile("sop_circuit_tb.vcd");  // Specify the VCD file name
        $dumpvars(0, sop_circuit_tb);     // Dump all signals from the testbench
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        A = 0; B = 0; C = 0; D = 0;
        
        // Display header
        $display("Time | A | B | C | D | F");
        $display("-------------------------");

        // Apply all combinations of inputs and observe output F
        #10 A = 0; B = 0; C = 0; D = 1;
        #10 A = 0; B = 0; C = 1; D = 0;
        #10 A = 0; B = 0; C = 1; D = 1;
        #10 A = 0; B = 1; C = 0; D = 0;
        #10 A = 0; B = 1; C = 0; D = 1;
        #10 A = 0; B = 1; C = 1; D = 0;
        #10 A = 0; B = 1; C = 1; D = 1;
        #10 A = 1; B = 0; C = 0; D = 0;
        #10 A = 1; B = 0; C = 0; D = 1;
        #10 A = 1; B = 0; C = 1; D = 0;
        #10 A = 1; B = 0; C = 1; D = 1;
        #10 A = 1; B = 1; C = 0; D = 0;
        #10 A = 1; B = 1; C = 0; D = 1;
        #10 A = 1; B = 1; C = 1; D = 0;
        #10 A = 1; B = 1; C = 1; D = 1;

        // Finish simulation
        $finish;
    end

    // Monitor the outputs for verification
    initial begin
        $monitor("%0t | %b | %b | %b | %b | %b", $time, A, B, C, D, F);
    end
endmodule
