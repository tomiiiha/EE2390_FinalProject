module stopwatch_flash(
    input  wire       clock,             // 100 MHz clock input
    input  wire       reset_n,           // Active-low reset
    input  wire       count_up_enable,   // Count up enable signal
    input  wire       count_down_enable, // Count down enable signal
    input  wire [3:0] minute,            // 4-bit minute value
    input  wire [3:0] sec_tens,          // 4-bit seconds tens value
    input  wire [3:0] sec_units,         // 4-bit seconds units value
    input  wire [3:0] tenth,             // 4-bit tenths value
    output reg        blink              // Blink output signal
);
  // only flash if we’re at zero and not actively counting
  wire at_zero  = (minute==0 && sec_tens==0 && sec_units==0 && tenth==0); 
  wire running = count_up_enable | count_down_enable;
  wire flash_enable = at_zero & ~running;

  reg [24:0] divider; // 25-bit divider for 100 MHz clock

  always @(posedge clock or negedge reset_n) begin

    if (!reset_n) begin // reset the divider and blink signal
      divider <= 0;
      blink <= 1;
    end
    
    else if (!flash_enable) begin
      // not in flash mode: solid on
      divider   <= 0;
      blink <= 1;
    end
    
    else begin
      // in flash mode: toggle every 25 million cycles (~0.25 sec at 100 MHz)
      if (divider == 25_000_000-1) begin
        divider   <= 0;
        blink <= ~blink;
      end
      
      else begin
        divider <= divider + 1;
      end
    end
  end
endmodule
