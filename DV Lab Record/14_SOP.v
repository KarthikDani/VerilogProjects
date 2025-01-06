module sop_circuit (
    input A, B, C, D,  // Inputs
    output F           // Output
);

assign F = (A & B & C) | (A & ~B & D) | (~A & C & D);

endmodule
