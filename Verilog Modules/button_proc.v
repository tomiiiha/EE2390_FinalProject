module button_proc (
  input  wire clk,
  input  wire rst_n,
  input  wire btn_in,
  output wire btn_pulse
);


  reg [2:0] sync;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)     sync <= 3'b000;
    else            sync <= { sync[1:0], btn_in };
  end


  reg [20:0] cnt;
  reg        db;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      cnt <= 0;
      db  <= 0;
    end else if (sync[2] == db) begin
      cnt <= 0;
    end else if (cnt == 2_000_000) begin
      db  <= sync[2];
      cnt <= 0;
    end else begin
      cnt <= cnt + 1;
    end
  end


  reg db_d;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)    db_d <= 0;
    else           db_d <= db;
  end

  assign btn_pulse = db & ~db_d;

endmodule