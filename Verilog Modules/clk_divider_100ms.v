module clk_divider_100ms(
    input  wire clock,  //100 MHz clock input
    input  wire reset,  //Active-high reset
    output reg  tick   //100 ms tick output
);

    reg[23:0] counter; // 24-bit counter to count clock cycles
    // 100 ms = 0.1 s = 100,000,000 ns / 1,000,000 = 10,000,000 clock cycles at 100 MHz

    always @(posedge clock) begin
        if (reset) begin //Reset the counter and tick signal
            counter <= 0; 
            tick    <= 0;

        end else if (counter == 10_000_000-1) begin //If counter reaches 10,000,000 (100 ms)
            counter <= 0;
            tick    <= 1;
            
        end else begin //Otherwise, increment the counter and set tick to 0
            counter <= counter + 1;
            tick    <= 0;
        end
    end
endmodule