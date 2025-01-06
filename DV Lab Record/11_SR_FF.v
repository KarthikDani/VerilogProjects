module sr_flip_flop (
    input S, R, clk, rst,  
    output reg Q, 
    output Qbar
);

always @(posedge clk or posedge rst) 
    if (rst) Q <= 0;
    else case ({S, R})
        2'b00: Q <= Q;
        2'b01: Q <= 0;
        2'b10: Q <= 1;
        2'b11: Q <= 1'bx;
    endcase

assign Qbar = ~Q;

endmodule
