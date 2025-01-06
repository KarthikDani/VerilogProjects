module half_subtractor (
    input A,        
    input B,       
    output Difference,       
    output Borrow   // Borrow output
);

assign Difference = A ^ B;             // Difference = A XOR B
assign Borrow = ~A & B;       // Borrow = NOT A AND B

endmodule
