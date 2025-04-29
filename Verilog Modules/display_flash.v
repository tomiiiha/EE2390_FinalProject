module display_flash(
    input wire blink,
    input wire [3:0] an_in,
    input wire [6:0] seg_in,
    input wire dp_in,
    output reg [3;0] an,
    output reg [6;0] seg,
    output reg dp
);

always @(*) begin
    if(!blink)begin
        an = 4'b1111;
        sec 7'b1111111;
        dp = 1'b1;
    end
    else begin
        an = an_in;
        seg = seg_in;
        dp = dp_in;
    end
end
endmodule