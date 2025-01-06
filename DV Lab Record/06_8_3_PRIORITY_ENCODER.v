module priority_encoder8to3 (
    input [7:0] d,    // 8 input lines
    input en,         // Enable signal
    output reg [2:0] y
);

always @(*) begin
    if (en) begin
        casex (d) 
            8'b1xxxxxxx: y = 3'b111;  // Input 7 is active
            8'b01xxxxxx: y = 3'b110;  // Input 6 is active
            8'b001xxxxx: y = 3'b101;  // Input 5 is active
            8'b0001xxxx: y = 3'b100;  // Input 4 is active
            8'b00001xxx: y = 3'b011;  // Input 3 is active
            8'b000001xx: y = 3'b010;  // Input 2 is active
            8'b0000001x: y = 3'b001;  // Input 1 is active
            8'b00000001: y = 3'b000;  // Input 0 is active
            default: y = 3'bzzz;      // Default case (if no inputs are high)
        endcase
    end else begin
        y = 3'bzzz; 
    end
end
endmodule