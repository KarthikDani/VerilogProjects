module jk_flip_flop (
    input J, K, clk, rst,  
    output reg Q, 
    output Qbar
);

always @(posedge clk or posedge rst) 
    if (rst) Q <= 0;
    else case ({J, K})
        2'b00: Q <= Q;    // No change
        2'b01: Q <= 0;    // Reset Q
        2'b10: Q <= 1;    // Set Q
        2'b11: Q <= ~Q;   // Toggle Q
    endcase

assign Qbar = ~Q;

endmodule
