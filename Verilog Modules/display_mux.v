module display_mux (
  input wire        clock,    //100 MHz clock input
  input wire        reset_n,  //Active-low reset
  input wire[3:0]   hex3, 
  input wire[3:0]   hex2,
  input wire[3:0]   hex1,
  input wire[3:0]   hex0,
  output reg[3:0]   anode,    //active low anode output
  output reg[6:0]   seg,      //7-segment display output
  output reg        decimal_p //decimal point output
);


  reg[16:0]  divider; // 17-bit counter to divide the clock frequency
  reg[1:0]   index;  // 2-bit index to select which digit to display
  wire       tick = (divider == 100_000-1); //100 ms tick for 100 MHz clock

  always @(posedge clock or negedge reset_n) begin 
    if (!reset_n) begin //Reset the counter and index
      divider <= 0;
      index <= 0;
    end 
    else if (tick) begin //If tick is high, increment the index and reset the divider
      divider <= 0;
      index <= index + 1;
    end
    else begin //If tick is low, increment the divider
      divider <= divider + 1;
    end
  end


  wire[6:0] seg0, seg1, seg2, seg3; //7-segment display outputs for each digit
  sevenseghexdecoder dec3(
    .hex(hex0), 
    .Seg(seg0)
  ); //Decode hex0 to 7-segment display

  sevenseghexdecoder dec2(
    .hex(hex1), 
    .Seg(seg1)
  ); //Decode hex1 to 7-segment display

  sevenseghexdecoder dec1(
    .hex(hex2), 
    .Seg(seg2)
  ); //Decode hex2 to 7-segment display
  
  sevenseghexdecoder dec0(
    .hex(hex3), 
    .Seg(seg3)
  ); //Decode hex3 to 7-segment display


  always @(*) begin
    case (index) //Select which digit to display based on the index
      2'd0: begin 
        anode = 4'b1110; 
        seg = seg0; 
        decimal_p = 1'b1; //Decimal point separating minutes and seconds
      end
      2'd1: begin 
        anode = 4'b1101;
        seg = seg1;
        decimal_p = 1'b0;
      end
      2'd2: begin 
        anode = 4'b1011;
        seg = seg2;
        decimal_p = 1'b1; //Decimal point separating seconds and tenths of seconds
      end
      2'd3: begin
        anode = 4'b0111;
        seg = seg3;
        decimal_p = 1'b0;
      end
      default: begin
        anode = 4'b1111;
        seg = 7'b1111111;
        decimal_p = 1'b1;
      end
    endcase
  end

endmodule