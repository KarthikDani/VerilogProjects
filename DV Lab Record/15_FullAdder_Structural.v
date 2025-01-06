module half_adder (
    input A, B,     
    output S, C    
);

assign S = A ^ B;    
assign C = A & B;    

endmodule


module full_adder (
    input A, B, Cin,  
    output S, Cout    
);

wire sum1, carry1, carry2;

half_adder HA1 (
    .A(A),
    .B(B),
    .S(sum1),
    .C(carry1)
);

half_adder HA2 (
    .A(sum1),
    .B(Cin),
    .S(S),
    .C(carry2)
);

assign Cout = carry1 | carry2;

endmodule
