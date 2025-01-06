`timescale 1ns / 1ps

module full_subtractor_tb;
    // Inputs
    reg A, B, Bin;

    // Outputs
    wire D, Bout;

    // Instantiate the full subtractor
    full_subtractor FS (
        .A(A),
        .B(B),
        .Bin(Bin),
        .D(D),
        .Bout(Bout)
    );

    // Create a VCD file to dump the simulation waveform
    initial begin
        $dumpfile("full_subtractor_tb.vcd");  // Specify the VCD file name
        $dumpvars(0, full_subtractor_tb);     // Dump all variables of the testbench
    end

    // Stimulus generation
    initial begin
        // Display the header
        $display("A  B  Bin | D  Bout");
        $display("---------------");

        // Apply test cases
        A = 0; B = 0; Bin = 0; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 0; B = 0; Bin = 1; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 0; B = 1; Bin = 0; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 0; B = 1; Bin = 1; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 1; B = 0; Bin = 0; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 1; B = 0; Bin = 1; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 1; B = 1; Bin = 0; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        A = 1; B = 1; Bin = 1; #10;
        $display("%b %b  %b  | %b  %b", A, B, Bin, D, Bout);

        $finish;  // Finish the simulation
    end
endmodule
