`timescale 1ns/1ps

module tb_stopwatch;
  reg        clk = 0;
  reg        rst;
  reg        start_btn;
  reg        stop_btn;
  reg        clear_btn;
  reg        count_down;
  wire [3:0] digit_min;
  wire [3:0] digit_st;
  wire [3:0] digit_su;
  wire [3:0] digit_tenths;

  stopwatch uut (
    .clk         (clk),
    .rst         (rst),
    .start_btn   (start_btn),
    .stop_btn    (stop_btn),
    .clear_btn   (clear_btn),
    .count_down  (count_down),
    .digit_min   (digit_min),
    .digit_st    (digit_st),
    .digit_su    (digit_su),
    .digit_tenths(digit_tenths)
  );

  // 100 MHz clock
  always #5 clk = ~clk;

  initial begin
    // reset
    rst = 1; start_btn = 0; stop_btn = 0; clear_btn = 0; count_down = 0;
    #20 rst = 0;

    // clear
    #10 clear_btn = 1; #10 clear_btn = 0;

    // start for 1 s
    #10 start_btn = 1; #10 start_btn = 0;
    #1_200_000_000;

    // stop
    stop_btn = 1; #10 stop_btn = 0;

    // switch to count‐down and resume
    count_down = 1;
    #10 start_btn = 1; #10 start_btn = 0;
    #100_000_000;

    #50 $finish;
  end

  // dump waves
  initial begin
    $dumpfile("stopwatch.vcd");
    $dumpvars(0, tb_stopwatch);
  end
endmodule
