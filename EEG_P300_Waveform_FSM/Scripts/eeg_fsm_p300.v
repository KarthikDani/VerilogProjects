module eeg_fsm_p300 (
    input clk,                 // Clock signal
    input reset,               // Reset signal
    input [7:0] eeg_signal,    // 8-bit EEG input signal
    output reg detected        // Output: P300 pattern detected or not
);
    // state Encoding
    parameter IDLE = 3'b000;
    parameter RISING = 3'b001;
    parameter PEAK = 3'b010;
    parameter FALLING = 3'b011;
    parameter DETECTED = 3'b100;

    reg [2:0] current_state, next_state;

    // Thresholds
    reg [7:0] baseline = 8'd50;         // Baseline signal value (calibrated value in reality.)
    reg [7:0] rise_threshold = 8'd70;   // Min peak amplitude
    reg [7:0] fall_threshold = 8'd60;   // decay

    // Counter for timeout during p300 detection
    reg [9:0] counter;

    // FSM Sequential Logic
    always @(posedge clk or posedge reset) begin
        // RESET = IDLE state
        if (reset) begin
            current_state <= IDLE;
            counter <= 0;
            detected <= 0;
        end 
        else begin
            current_state <= next_state;
            // Update counter based on state
            if (current_state == RISING || current_state == PEAK) begin
                counter <= counter + 1;
            end else begin
                counter <= 0; // Reset counter for other states
            end
        end
    end

    // FSM Combinational Logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                // Move to RISING state
                if (eeg_signal > baseline)
                    next_state = RISING;
            end
            RISING: begin
                // CASE: Timeout
                if (counter >= 300) begin
                    next_state = IDLE;
                end
                // Move to PEAK state 
                else if (eeg_signal > rise_threshold) begin
                    next_state = PEAK;
                end
                 // CASE: False start
                else if (eeg_signal <= baseline) begin
                    next_state = IDLE;        
                end
            end
            PEAK: begin
                // CASE: Timeout
                if (counter >= 300) begin
                    next_state = IDLE;        
                end
                // Move to FALLING state
                else if (eeg_signal <= fall_threshold) begin
                    next_state = FALLING;
                end
                 // CASE: False pattern
                else if (eeg_signal < rise_threshold) begin
                    next_state = IDLE;     
                end
            end
            FALLING: begin
                // Move to Pattern Detected state
                if (eeg_signal <= baseline)
                    next_state = DETECTED;
            end
            DETECTED: begin
                // P300 pattern detected
                detected = 1;               
            end
            default: begin
                next_state = IDLE;  // Reset FSM by default or any Invalid transition
                detected = 0;       // Set to LOW in next cycle after its HIGH OR by Default.
            end
        endcase
    end
endmodule