module stopwatch_ctrl(
  input  wire clock,         //100 MHz clock input
  input  wire reset,         //Active-high reset
  input  wire start_button,  //Start button
  input  wire stop_button,   //Stop button
  input  wire clear_button,  //Clear button
  input  wire count_down,    //Count down mode
  input  wire at_zero,       //At zero flag
  output reg  running,       //Running flag
  output reg  direction,     //Direction flag (1 for up, 0 for down)
  output wire clear_pulse    //Clear pulse signal
);

  assign clear_pulse = clear_button & ~running; // Generate a pulse when clear button is pressed and stopwatch is not running

  reg mode_down; // Mode down flag (1 for count down, 0 for count up)

  always @(posedge clock or posedge reset) begin
    if (reset) // Reset the mode down flag                
      mode_down <= 0;

    else if (!running && count_down) // Set mode down flag when count down button is pressed and stopwatch is not running
      mode_down <= ~mode_down;
  end

  always @(posedge clock or posedge reset) begin

    if (reset) begin // Reset the running and direction flags
      running <= 0;
      direction     <= 1;

    end
    else begin // Check for button presses and update the running and direction flags accordingly
      if (!running && start_button) begin
        running <= 1;
        direction <= mode_down ? 0 : 1;
      end

      else if (running && stop_button) begin
        running <= 0;

        if(!running && stop_button) begin // If stopwatch is stopped and stop button is pressed, set direction based on mode_down flag
          running <= 1;
          direction <= mode_down ? 0 : 1;
        end
        
        else if(running && stop_button) begin // If stopwatch is running and stop button is pressed, set running to 0
          running <= 0;
        end
      end
    end
  end

endmodule
