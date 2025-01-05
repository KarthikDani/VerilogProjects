module sequence_10010_detector_mealy_overlap (
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
                S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State Transition
    always @(posedge clk or negedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next State Logic and Output Logic
    always @(*) begin
        dout = 1'b0; // Default output
        case (current_state)
            S0: begin
                next_state = (din == 1'b1) ? S1 : S0;
            end
            S1: begin
                next_state = (din == 1'b0) ? S2 : S0;
            end
            S2: begin
                next_state = (din == 1'b0) ? S3 : S1;
            end
            S3: begin
                next_state = (din == 1'b1) ? S4 : S0;
            end
            S4: begin
                if (din == 1'b0) begin
                    dout = 1'b1; // Sequence detected
                    next_state = S2; // Overlap handling
                end else begin
                    next_state = S1;
                end
            end
            default: next_state = S0;
        endcase
    end
endmodule
