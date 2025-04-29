module stopwatch(
    input  wire       clock,           // 100 MHz clock input
    input  wire       reset,           // active‑high reset
    input  wire       start_button,    // start button
    input  wire       stop_button,     // stop button
    input  wire       clear_button,    // clear button
    input  wire       count_down,      // count down mode
    output wire [3:0] digit_minute,    // minutes (0–9)
    output wire [3:0] digit_sec_tens,  // seconds tens (0–5)
    output wire [3:0] digit_sec_units, // seconds units (0–9)
    output wire [3:0] digit_tenths,    // tenths (0–9)
    output wire       running,         // running flag
    output wire       direction        // direction flag (1 for up, 0 for down)
);

  // 100 ms tick generator
  wire tick_100ms;
  clk_divider_100ms u_div (
    .clock(clock),
    .reset(reset),
    .tick(tick_100ms)
  );

  wire at_zero = (digit_minute == 0 &&
                  digit_sec_tens == 0 &&
                  digit_sec_units == 0 &&
                  digit_tenths == 0);

                  
  // control FSM: running, direction, clear pulse
  wire run, dir, clear_pulse;

  stopwatch_ctrl u_ctrl (
    .clock         (clock),
    .reset         (reset),
    .start_button  (start_button),
    .stop_button   (stop_button),
    .clear_button  (clear_button),
    .count_down    (count_down),
    .running       (run),
    .direction     (direction),
    .clear_pulse   (clear_pulse),
    .at_zero       (at_zero)
  );

  // gate the tick so counters only advance when “run” is high and we’re not at zero
  wire enable_count = run & tick_100ms & ~at_zero;

  // tenths digit (0–9)
  wire carry_out_tenths;

  bcd_counter #(.MAX(9)) u_tenths (
    .clock      (clock),
    .reset      (reset),
    .clear      (clear_pulse),
    .enable     (enable_count),
    .direction  (direction),
    .count      (digit_tenths),
    .carry_out  (carry_out_tenths)
  );

  // seconds‑units (0–9)
  wire carry_out_ones;

  bcd_counter #(.MAX(9)) u_su (
    .clock      (clock),
    .reset      (reset),
    .clear      (clear_pulse),
    .enable     (carry_out_tenths),
    .direction  (direction),
    .count      (digit_sec_units),
    .carry_out  (carry_out_ones)
  );

  // seconds‑tens (0–5)
  wire carry_out_minutes;
  
  bcd_counter #(.MAX(5)) u_st (
    .clock      (clock),
    .reset      (reset),
    .clear      (clear_pulse),
    .enable     (carry_out_ones),
    .direction  (direction),
    .count      (digit_sec_tens),
    .carry_out  (carry_out_minutes)
  );

  // minutes (0–9)
  bcd_counter #(.MAX(9)) u_min (
    .clock      (clock),
    .reset      (reset),
    .clear      (clear_pulse),
    .enable     (carry_out_minutes),
    .direction  (direction),
    .count      (digit_minute),
    .carry_out  ()        // we don’t cascade past minutes
  );

endmodule