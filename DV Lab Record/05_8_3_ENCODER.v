module encoder8to3 (
    input [7:0] d,    // 8 input lines
    input en,         // Enable signal
    output reg [2:0] y // 3-bit encoded output
);

always @(*) begin
    if (en) begin
        case (d)
            8'b0000_0001: y = 3'b000;
            8'b0000_0010: y = 3'b001;
            8'b0000_0100: y = 3'b010;
            8'b0000_1000: y = 3'b011;
            8'b0001_0000: y = 3'b100;
            8'b0010_0000: y = 3'b101;
            8'b0100_0000: y = 3'b110;
            8'b1000_0000: y = 3'b111;
            default: y = 3'bzzz; // Default value
        endcase
    end else begin
        y = 3'bzzz; // Output is 0 when disabled
    end
end
endmodule