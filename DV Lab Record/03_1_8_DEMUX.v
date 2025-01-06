module demux1to8 (
    input d,         // Single data input
    input [2:0] s,   // 3-bit select input
    output reg [7:0] y // 8 outputs
);

always @(d, s) begin
    y = 8'b0;       // Default: All outputs are 0
    case (s)
        3'b000: y[0] = d;
        3'b001: y[1] = d;
        3'b010: y[2] = d;
        3'b011: y[3] = d;
        3'b100: y[4] = d;
        3'b101: y[5] = d;
        3'b110: y[6] = d;
        3'b111: y[7] = d;
    endcase
end
endmodule
