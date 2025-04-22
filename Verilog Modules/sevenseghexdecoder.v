module sevenseghexdecoder(
	input wire [3:0] hex,
	output reg [0:6] Seg
);
	
	always @(hex) begin
		case(hex)
			4'h0:	Seg = 7'b100_0000;
			4'h1:	Seg = 7'b111_1001;
			4'h2:	Seg = 7'b010_0100;
			4'h3:	Seg = 7'b011_0000;
			4'h4:	Seg = 7'b001_1001;
			4'h5:	Seg = 7'b001_0010;
			4'h6:	Seg = 7'b000_0010;
			4'h7:	Seg = 7'b111_1000;
			4'h8:	Seg = 7'b000_0000;
			4'h9:	Seg = 7'b001_1000;
			//4'hA:   Seg = 7'b000_1000;  // A
      		//4'hB:   Seg = 7'b110_0000;  // b
      		//4'hC:   Seg = 7'b011_0001;  // C
      		//4'hD:   Seg = 7'b100_0010;  // d
      		//4'hE:   Seg = 7'b011_0000;  // E
      		//4'hF:   Seg = 7'b011_1000;  // F
			default:	Seg = 7'b111_1111;
		endcase
	end
endmodule

