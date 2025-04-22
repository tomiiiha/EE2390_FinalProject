module clk_divider_100ms(
    input  wire clk,
    input  wire rst,
    output reg  tick
);

    reg [23:0] counter;

    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
            tick    <= 0;
        end else if (counter == 10_000_000-1) begin
            counter <= 0;
            tick    <= 1;
        end else begin
            counter <= counter + 1;
            tick    <= 0;
        end
    end
endmodule