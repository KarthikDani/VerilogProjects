module mux2to1 (
    input [1:0] d,   // Data inputs
    input s,         // Select input
    input en,        // Enable signal
    output reg y     // Output
);

always @(*) begin
    if (en)
        y = s ? d[1] : d[0];
    else
        y = 1'bz; // Output is 0 when disabled
end

endmodule
