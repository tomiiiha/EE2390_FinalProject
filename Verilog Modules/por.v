module por (
  input  wire clk,
  output reg  rst_n
);
  reg [19:0] cnt;
  always @(posedge clk) begin
    if (cnt < 20'd1_000_000) begin
      cnt   <= cnt + 1;
      rst_n <= 1'b0;
    end else begin
      rst_n <= 1'b1;
    end
  end
endmodule