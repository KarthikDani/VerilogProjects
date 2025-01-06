module d_flip_flop (
    input D, clk, rst,  
    output reg Q, 
    output Qbar
);

always @(D, posedge clk or posedge rst) 
    if (rst) Q <= 0;
    else Q <= D;

assign Qbar = ~Q;

endmodule
