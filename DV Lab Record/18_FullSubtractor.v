module full_subtractor (
    input A, B, Bin,   
    output D, Bout    
);

assign D = A ^ B ^ Bin;  // XOR of A, B, and Bin
assign Bout = (~A & (B | Bin)) | ((A ^ B) & Bin);  // Borrow logic

endmodule
