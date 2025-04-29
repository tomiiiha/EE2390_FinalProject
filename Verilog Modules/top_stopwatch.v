module top_stopwatch (
  input  wire       CLOCK100MHZ,
  input  wire       RESET_N,
  input  wire       BUTTON0,
  input  wire       BUTTON1,
  input  wire       BUTTON2,
  input  wire       BUTTON3,
  output wire[3:0]  ANODE,
  output wire[6:0]  SEG,
  output wire       DECIMAL_P

  //debugging
  //output wire       LED0,
  //output wire       LED1,
  //output wire       LED2,
  //output wire       LED3,
);

  //assign LED0 = start_p;
  //assign LED1 = stop_p;
  //assign LED2 = clear_p;
  //assign LED3 = cd_p;

  wire blink;
  wire[3:0] an_mux;
  wire[6:0] seg_mux;
  wire dp_mux;

  wire power_on_reset_reset_n;
  power_on_reset u_power_on_reset (
    .clock   (CLOCK100MHZ),
    .reset_n (power_on_reset_reset_n)
  );

  wire reset_n_int = power_on_reset_reset_n;


  wire start_p, stop_p, clear_p, cd_p;

//Buttons
//--------------------------------------------------------------
  button_proc u_btn_start ( 
    .clock           (CLOCK100MHZ), 
    .reset_n         (reset_n_int), 
    .button_input    (BUTTON0), 
    .button_pulse    (start_p) 
);

  button_proc u_btn_stop  ( 
    .clock           (CLOCK100MHZ), 
    .reset_n         (reset_n_int), 
    .button_input    (BUTTON1), 
    .button_pulse    (stop_p)  
);

  button_proc u_btn_clear ( 
    .clock           (CLOCK100MHZ), 
    .reset_n         (reset_n_int), 
    .button_input    (BUTTON2), 
    .button_pulse    (clear_p) 
);
  button_proc u_btn_cd    ( 
    .clock           (CLOCK100MHZ), 
    .reset_n         (reset_n_int), 
    .button_input    (BUTTON3), 
    .button_pulse    (cd_p)
);
//--------------------------------------------------------------

  wire run, dir;
  wire [3:0] d_min, d_st, d_su, d_ten;

  stopwatch u_sw (
    .clock             (CLOCK100MHZ),
    .reset             (~reset_n_int),    // active‑high reset
    .start_button      (start_p),
    .stop_button       (stop_p),
    .clear_button      (clear_p),
    .count_down        (cd_p),
    .digit_minute      (d_min),
    .digit_sec_tens    (d_st),
    .digit_sec_units   (d_su),
    .digit_tenths      (d_ten),
    .running           (run),
    .direction         (dir)
  );

  stopwatch_flash u_flashgen(
    .clock              (CLOCK100MHZ),
    .reset_n            (reset_n_int),
    .count_up_enable    (run & dir),
    .count_down_enable  (run & ~dir),
    .minute             (d_min),
    .sec_tens           (d_st),
    .sec_units          (d_su),
    .tenth              (d_ten),
    .blink              (blink)
  );

  display_flash u_display_flash (
    .blink           (blink),
    .anode_in        (an_mux),
    .seg_in          (seg_mux),
    .decimal_p_in    (dp_mux),
    .anode           (ANODE),
    .seg             (SEG),
    .decimal_p       (DECIMAL_P)
  );


  wire [6:0] seg0, seg1, seg2, seg3;
  sevenseghexdecoder dec0(
    .hex(d_ten),
    .Seg(seg0)
  );

  sevenseghexdecoder dec1(
    .hex(d_su), 
    .Seg(seg1)
  );

  sevenseghexdecoder dec2(
    .hex(d_st),  
    .Seg(seg2)
  );
  
  sevenseghexdecoder dec3(
    .hex(d_min), 
    .Seg(seg3)
  );


  display_mux u_mux (
    .clock        (CLOCK100MHZ),
    .reset_n      (reset_n_int),
    .hex3         (d_min),
    .hex2         (d_st),
    .hex1         (d_su),
    .hex0         (d_ten),
    .anode        (an_mux),
    .seg          (seg_mux),
    .decimal_p    (dp_mux)
  );
endmodule