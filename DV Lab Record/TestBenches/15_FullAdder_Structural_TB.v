`timescale 1ns / 1ps

module full_adder_tb;
    // Inputs
    reg A, B, Cin;

    // Outputs
    wire S, Cout;

    // Instantiate the full adder
    full_adder FA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Create a VCD file to dump the simulation waveform
    initial begin
        $dumpfile("full_adder_tb.vcd");  // Specify the VCD file name
        $dumpvars(0, full_adder_tb);     // Dump all variables of the testbench
    end

    // Stimulus generation
    initial begin
        // Display the header
        $display("A B Cin | S Cout");
        $display("-------------");

        // Apply test cases
        A = 0; B = 0; Cin = 0; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 0; B = 0; Cin = 1; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 0; B = 1; Cin = 0; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 0; B = 1; Cin = 1; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 1; B = 0; Cin = 0; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 1; B = 0; Cin = 1; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 1; B = 1; Cin = 0; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        A = 1; B = 1; Cin = 1; #10;
        $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

        $finish;  // Finish the simulation
    end
endmodule
