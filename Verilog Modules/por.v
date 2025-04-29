// This module generates a power-on reset signal (reset_n) that is active low.
module por (
  input  wire clock, //100 MHz clock input
  output reg  reset_n //Active-low reset output
);
  reg [19:0] count; // 20-bit counter to count clock cycles
  always @(posedge clock) begin
    if (count < 20'd1_000_000) begin // Count for 1 second at 1 MHz
      count   <= count + 1; // Increment the counter
      reset_n <= 1'b0; // Set reset_n to low during the count
    end else begin // After 1 second, set reset_n to high
      reset_n <= 1'b1;
    end
  end
endmodule