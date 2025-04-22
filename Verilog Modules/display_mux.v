module display_mux (
  input  wire       clk,
  input  wire       rst_n,
  input  wire [3:0] hex3,
  input  wire [3:0] hex2,
  input  wire [3:0] hex1,
  input  wire [3:0] hex0,
  output reg  [3:0] an,
  output reg  [6:0] seg,
  output reg        dp
);


  reg [16:0] div;
  reg  [1:0] idx;
  wire       tick = (div == 100_000-1);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div <= 0;
      idx <= 0;
    end else if (tick) begin
      div <= 0;
      idx <= idx + 1;
    end else begin
      div <= div + 1;
    end
  end


  wire [6:0] seg0, seg1, seg2, seg3;
  sevenseghexdecoder dec3(.hex(hex0), .Seg(seg0));
  sevenseghexdecoder dec2(.hex(hex1), .Seg(seg1));
  sevenseghexdecoder dec1(.hex(hex2), .Seg(seg2));
  sevenseghexdecoder dec0(.hex(hex3), .Seg(seg3));


  always @(*) begin
    case (idx)
      2'd0: begin an = 4'b1110; seg = seg0; dp = 1'b1; end
      2'd1: begin an = 4'b1101; seg = seg1; dp = 1'b0; end
      2'd2: begin an = 4'b1011; seg = seg2; dp = 1'b1; end
      2'd3: begin an = 4'b0111; seg = seg3; dp = 1'b0; end
      default: begin an = 4'b1111; seg = 7'b1111111; dp = 1'b1; end
    endcase
  end

endmodule