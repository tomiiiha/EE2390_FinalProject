module stopwatch_ctrl(
  input  wire clk,
  input  wire rst,
  input  wire start_btn,
  input  wire stop_btn,
  input  wire clear_btn,
  input  wire count_down,
  output reg  running,
  output reg  dir,
  output wire clear_pulse
);

  assign clear_pulse = clear_btn & ~running;

  reg mode_down;
  always @(posedge clk or posedge rst) begin
    if (rst)                
      mode_down <= 0;
    else if (!running && count_down)
      mode_down <= ~mode_down;
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      running <= 0;
      dir     <= 1;
    end else begin
      if (!running && start_btn) begin
        running <= 1;
        dir     <= mode_down ? 0 : 1;
      end
      else if (running && stop_btn) begin
        running <= 0;
      end
    end
  end

endmodule
