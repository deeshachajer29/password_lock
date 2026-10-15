module password_lock(
    input wire clk,
    input wire rst,
    input wire password_bit,
    output reg unlock
);
 parameter s0 = 3'd0;
 parameter s1 = 3'd1;
 parameter s2 = 3'd2;
 parameter s3 = 3'd3;
 parameter s4 = 3'd4;

 reg [2:0] state;
 reg [2:0] next_state;

 always @(posedge clk) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

 always @(*) begin

    case(state)

    s0: begin
    if (password_bit == 0)
        next_state = s0;
    else
        next_state = s1;
    end

    s1: begin
    if (password_bit == 0)
        next_state = s2;
    else
        next_state = s0;
    end

    s2: begin
    if (password_bit == 0)
        next_state = s0;
    else
        next_state = s3;
    end

    s3: begin
    if (password_bit == 0)
        next_state = s0;
    else
        next_state = s4;
    end

    s4: begin
    if (password_bit == 0)
        next_state = s0;
    else
        next_state = s4;
end
    endcase
    end

    always @(*) begin
        if (state == s4)
            unlock = 1;
        else
            unlock = 0;
    end
endmodule