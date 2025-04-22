module stopwatch(
    input  wire       clk,
    input  wire       rst,         // active‑high reset
    input  wire       start_btn,
    input  wire       stop_btn,
    input  wire       clear_btn,
    input  wire       count_down,
    output wire [3:0] digit_min,
    output wire [3:0] digit_st,
    output wire [3:0] digit_su,
    output wire [3:0] digit_tenths
);

  // 100 ms tick generator
  wire tick_100ms;
  clk_divider_100ms u_div (
    .clk(clk),
    .rst(rst),
    .tick(tick_100ms)
  );

  // control FSM: running, direction, clear pulse
  wire run, dir, clr_pulse;
  stopwatch_ctrl u_ctrl (
    .clk        (clk),
    .rst        (rst),
    .start_btn  (start_btn),
    .stop_btn   (stop_btn),
    .clear_btn  (clear_btn),
    .count_down (count_down),
    .running    (run),
    .dir        (dir),
    .clear_pulse(clr_pulse)
  );

  // gate the tick so counters only advance when “run” is high
  wire en_cnt = run & tick_100ms;

  // tenths digit (0–9)
  wire roll1;
  bcd_counter #(.MAX(9)) u_tenths (
    .clk  (clk),
    .rst  (rst),
    .clr  (clr_pulse),
    .en   (en_cnt),
    .dir  (dir),
    .count(digit_tenths),
    .roll (roll1)
  );

  // seconds‑units (0–9)
  wire roll2;
  bcd_counter #(.MAX(9)) u_su (
    .clk  (clk),
    .rst  (rst),
    .clr  (clr_pulse),
    .en   (roll1),
    .dir  (dir),
    .count(digit_su),
    .roll (roll2)
  );

  // seconds‑tens (0–5)
  wire roll3;
  bcd_counter #(.MAX(5)) u_st (
    .clk  (clk),
    .rst  (rst),
    .clr  (clr_pulse),
    .en   (roll2),
    .dir  (dir),
    .count(digit_st),
    .roll (roll3)
  );

  // minutes (0–9)
  bcd_counter #(.MAX(9)) u_min (
    .clk  (clk),
    .rst  (rst),
    .clr  (clr_pulse),
    .en   (roll3),
    .dir  (dir),
    .count(digit_min),
    .roll ()        // we don’t cascade past minutes
  );

endmodule
