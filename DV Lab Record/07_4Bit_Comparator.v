module cmp4 (
    input [3:0] x,  // 4-bit input x
    input [3:0] y,  // 4-bit input y
    output reg eq,   // Output: 1 if x == y
    output reg gt,   // Output: 1 if x > y
    output reg lt    // Output: 1 if x < y
);

always @(*) begin
    if (x == y) begin
        eq = 1;
        gt = 0;
        lt = 0;
    end else if (x > y) begin
        eq = 0;
        gt = 1;
        lt = 0;
    end else begin
        eq = 0;
        gt = 0;
        lt = 1;
    end
end
endmodule
