module bcd_counter #(
  parameter MAX = 9
)(
  input  wire       clk,
  input  wire       rst,
  input  wire       clr,
  input  wire       en,
  input  wire       dir,
  output reg  [3:0] count,
  output reg        roll
);

    always @(posedge clk) begin
        if (rst | clr) begin
            count <= 0;
            roll  <= 0;
        end else if (en) begin
            if (dir) begin
                if (count == MAX) begin
                    count <= 0;
                    roll  <= 1;
                end else begin
                    count <= count + 1;
                    roll  <= 0;
                end
            end else begin
                if (count == 0) begin
                    count <= MAX;
                    roll  <= 1;
                end else begin
                    count <= count - 1;
                    roll  <= 0;
                end
            end
        end else begin
            roll <= 0;
        end
    end
endmodule