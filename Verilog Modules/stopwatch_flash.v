module stopwatch_flash(
    input wire clk,
    input wire rst_n,
    input wire count_up_en,
    input wire count_down_en,
    input wire [3:0] min,
    input wire [3:0] sec_tens,
    input wire [3:0] sec_units,
    input wire [3:0] tenth,
    output reg blink
);

wire running = count_up_en | count_down_en;

wire at_zero = (min == 4'd0 && sec_tens == 4'd0 &&
                sec_units == 4'd0 && tenth == 4'd0);
wire flash_enable = running && at_zero;

//blink code
reg[25:0] div;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        div <= 0;
        blink <= 1;
    end
    else if(flash_enable)begin
        if(div == 25_000_000 - 1)begin
            div <= 0;
            blink <= ~blink;
        end
        else begin
            div <= 0;
            blink <= 1;
        end
    end
end
endmodule;