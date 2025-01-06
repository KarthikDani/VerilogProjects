module decoder2to4 (
    input [1:0] a,   // 2-bit input
    input en,        // Enable signal
    output reg [3:0] y // 4 outputs
);

always @(*) begin
    if (en)
        case (a)
            2'b00: y = 4'b0001;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;
        endcase
    else
        y = 4'bzzzz;
end

endmodule
