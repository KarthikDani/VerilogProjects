module gray_to_bin (
    input [3:0] g,  // 4-bit Gray code input
    output [3:0] b  // 4-bit binary output
);

assign b = {g[3], g[3]^g[2], g[3]^g[2]^g[1], g[3]^g[2]^g[1]^g[0]};

endmodule
