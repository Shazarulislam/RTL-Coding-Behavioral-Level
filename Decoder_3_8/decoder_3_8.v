`timescale 1ns/1ns
module decoder_3_8(a,y);
input [2:0]a;
output reg [7:0]y;


	always @(a) begin
		case(a)
			3'b000 : y= 8'b0000_0001;
			3'b001 : y= 8'b0000_0010;
			3'b010 : y= 8'b0000_0100;
			3'b011 : y= 8'b0000_1000;
			3'b100 : y= 8'b0001_0000;
			3'b101 : y= 8'b0010_0000;
			3'b110 : y= 8'b0100_0000;
			3'b111 : y= 8'b1000_0000;
			default: y=8'bxxxx_xxxx;
		endcase
	end
endmodule

///test bench///
module tb; 
reg [2:0] a;  //dut input
wire [7:0] y;  //dut output

integer i;

test_case f(a,y); //dut module instantiation

initial begin
for (i=0 ; i< 9 ; i= i+1)
	begin
	#10 {a} = i;
	end
end

initial
$monitor ("T=%0t | a=%b | y=%b", $realtime, a,y);
endmodule

