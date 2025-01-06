`timescale 1ns / 1ps

module array_multiplier_2x2_tb;
    // Inputs
    reg [1:0] A, B;

    // Outputs
    wire [3:0] P;

    // Instantiate the array multiplier
    array_multiplier_2x2 AM (
        .A(A),
        .B(B),
        .P(P)
    );

    // Create a VCD file to dump the simulation waveform
    initial begin
        $dumpfile("array_multiplier_2x2_tb.vcd");  // Specify the VCD file name
        $dumpvars(0, array_multiplier_2x2_tb);     // Dump all variables of the testbench
    end

    // Stimulus generation
    initial begin
        // Display the header
        $display("A  B  |  P");
        $display("------------");

        // Apply test cases
        A = 2'b00; B = 2'b00; #10;
        $display("%b %b | %b", A, B, P);

        A = 2'b01; B = 2'b01; #10;
        $display("%b %b | %b", A, B, P);

        A = 2'b10; B = 2'b10; #10;
        $display("%b %b | %b", A, B, P);

        A = 2'b11; B = 2'b11; #10;
        $display("%b %b | %b", A, B, P);

        $finish;  // Finish the simulation
    end
endmodule
