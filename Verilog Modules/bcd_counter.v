module bcd_counter #(
  parameter MAX = 9
)(
  input  wire       clock, //Clock signal
  input  wire       reset, //Reset signal
  input  wire       clear, //Clear signal
  input  wire       enable, //Enable signal
  input  wire       direction, //Direction signal (1 for up, 0 for down)
  output reg[3:0]   count, //4-bit count output
  output reg        carry_out //Carry out signal (1 if count rolls over)
);

    always @(posedge clock) begin //On clock edge

        if (reset | clear) begin //Reset or clear the counter

            count <= 0; //Reset count to 0
            carry_out  <= 0; //Reset carry out signal

        end else if (enable) begin //Enable counting

            if (direction) begin //Count up

                if (count == MAX) begin //If count reaches maximum value
                    count <= 0;
                    carry_out  <= 1;

                end else begin //If count is less than maximum value

                    count <= count + 1;
                    carry_out  <= 0;
                end

            end else begin //Count down

                if (count == 0) begin //If count reaches minimum value
                    count <= MAX;
                    carry_out  <= 1;

                end else begin //If count is greater than 0

                    count <= count - 1;
                    carry_out  <= 0;

                end
            end

        end else begin //If counting is not enabled
            carry_out <= 0;
        end
    end
endmodule