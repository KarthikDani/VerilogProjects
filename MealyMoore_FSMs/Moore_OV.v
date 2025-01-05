module sequence_1101_detector_moore_overlap (
    input clk,
    input reset,
    input din,
    output reg dout
);
    // State Encoding
    parameter   S0 = 3'b000,
                S1 = 3'b001,
                S2 = 3'b010,
                S3 = 3'b011,
                S4 = 3'b100; // Output state

    reg [2:0] current_state, next_state;

    // State Transition
    always @(posedge clk or negedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case (current_state)
            S0: next_state = (din == 1'b1) ? S1 : S0;
            S1: next_state = (din == 1'b1) ? S2 : S0;
            S2: next_state = (din == 1'b0) ? S3 : S2;
            S3: next_state = (din == 1'b1) ? S4 : S0;
            S4: next_state = (din == 1'b1) ? S2 : S0; // Overlap handling
            default: next_state = S0;
        endcase
    end

    // Output Logic
    always @(*) begin
        if (next_state == S4) // makes dout = 1 in the same cycle
            dout = 1'b1; // Sequence detected
        else
            dout = 1'b0;
    end
endmodule
