module top_stopwatch (
  input  wire       CLK100MHZ,
  input  wire       RST_N,
  input  wire       BTN0,
  input  wire       BTN1,
  input  wire       BTN2,
  input  wire       BTN3,
  output wire [3:0] AN,
  output wire [6:0] SEG,
  output wire       DP
);

  wire por_rstn;
  por u_por (
    .clk   (CLK100MHZ),
    .rst_n (por_rstn)
  );

  wire rstn_int = por_rstn;


  wire start_p, stop_p, clear_p, cd_p;


  button_proc u_btn_start ( 
    .clk(CLK100MHZ), 
    .rst_n(rstn_int), 
    .btn_in(BTN0), 
    .btn_pulse(start_p) 
);

  button_proc u_btn_stop  ( 
    .clk(CLK100MHZ), 
    .rst_n(rstn_int), 
    .btn_in(BTN1), 
    .btn_pulse(stop_p)  
);

  button_proc u_btn_clear ( 
    .clk(CLK100MHZ), 
    .rst_n(rstn_int), 
    .btn_in(BTN2), 
    .btn_pulse(clear_p) 
);
  button_proc u_btn_cd    ( 
    .clk(CLK100MHZ), 
    .rst_n(rstn_int), 
    .btn_in(BTN3), 
    .btn_pulse(cd_p)
);

  wire [3:0] d_min, d_st, d_su, d_ten;
  stopwatch u_sw (
    .clk         (CLK100MHZ),
    .rst         (~rstn_int),    // active‑high reset
    .start_btn   (start_p),
    .stop_btn    (stop_p),
    .clear_btn   (clear_p),
    .count_down  (cd_p),
    .digit_min   (d_min),
    .digit_st    (d_st),
    .digit_su    (d_su),
    .digit_tenths(d_ten)
  );


  wire [6:0] seg0, seg1, seg2, seg3;
  sevenseghexdecoder dec0(.hex(d_ten), .Seg(seg0));
  sevenseghexdecoder dec1(.hex(d_su),  .Seg(seg1));
  sevenseghexdecoder dec2(.hex(d_st),  .Seg(seg2));
  sevenseghexdecoder dec3(.hex(d_min), .Seg(seg3));


  display_mux u_mux (
    .clk    (CLK100MHZ),
    .rst_n  (rstn_int),
    .hex3   (d_min),
    .hex2   (d_st),
    .hex1   (d_su),
    .hex0   (d_ten),
    .an     (AN),
    .seg    (SEG),
    .dp     (DP)
  );
endmodule