module stopwatch_ctrl(
  input  wire clk,
  input  wire rst,
  input  wire start_btn,
  input  wire stop_btn,
  input  wire clear_btn,
  input  wire count_down,
  input  wire at_zero,      // New input to detect when counter is at zero
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

  // Simplified state machine logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      running <= 0;
      dir     <= 1;
    end else begin
      if (start_btn) begin
        running <= 1;
        dir     <= mode_down ? 0 : 1;
      end
      if (stop_btn || (at_zero && !start_btn)) begin
        running <= 0;
      end
    end
  end

endmodule
