module display_flash(
    input wire blink, // active high blink signal
    input wire [3:0] anode_in, // active low anode input
    input wire [6:0] seg_in, // 7-segment display input
    input wire decimal_p_in, // decimal point input
    output reg [3:0] anode,  // active low anode output
    output reg [6:0] seg, // 7-segment display output
    output reg decimal_p // decimal point output
);

  always @(*) begin
    if (blink) begin
      // display is “on”
      anode = anode_in;
      seg = seg_in;
      decimal_p  = decimal_p_in;
    end else begin
      // blank display
      anode  = 4'b1111;
      seg = 7'b1111111;
      decimal_p  = 1'b1;
    end
  end
endmodule