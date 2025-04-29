module button_proc (
  input  wire clock, //Clock signal
  input  wire reset_n, //Reset signal (active low)
  input  wire button_input, //Button input signal
  output wire button_pulse //One pulse output signal
);


  reg [2:0] sync; //3-bit shift register for synchronizing the button input

  always @(posedge clock or negedge reset_n) begin 

    if (!reset_n) //Reset the shift register

      sync <= 3'b000;
    else //Shift the button input into the register
      sync <= { sync[1:0], button_input };
  end


  reg [20:0] count; //Counter for debouncing
  reg        debounced; //Debounced button state

  always @(posedge clock or negedge reset_n) begin 

    if (!reset_n) begin //Reset the counter and debounced state
      count <= 0; //Reset the counter
      debounced  <= 0; //Assume the button is not pressed

    end else if (sync[2] == debounced) begin //If input is steady
      count <= 0; //Reset the counter

    end else if (count == 2_000_000) begin //After 20ms at 100MHz...
      debounced <= sync[2]; //Update the debounced state
      count <= 0; //Reset the counter

    end else begin //If input is changing and not yet debounced
      count <= count + 1; //Keep counting
    end
  end


  reg debounced_delayed; //Delayed version of the debounced signal

  always @(posedge clock or negedge reset_n) begin
    if (!reset_n) //Reset the delayed signal
      debounced_delayed <= 0; //Reset to 0
    else
      debounced_delayed <= debounced; //Store the previous cycle's debounced state
  end

  assign button_pulse = debounced & ~debounced_delayed; //Generate pulse on rising edge of debounced signal

endmodule