`timescale 1 ns/ 1ns
module sr_latch(sr,q);
input [1:0] sr;
output q;
reg q;
always @(sr or q) begin
    case(sr)
        2'b01 : q<= 1'b1;
        2'b10 : q<= 1'b0;
        2'b11 : q<= q;
    default : q<= 1'bx;
    endcase
end
endmodule

//test bench//
module sr_latch_tb;
reg [1:0 ]sr;
wire q;

sr_latch f(sr,q); //module instantiation
integer i;

initial begin
for (i=1 ; i < 4 ; i= i+1) begin
	#10 {sr} =i;
	end
end

initial
$monitor ("T= %0t \n sr = %b | q= %b",$realtime,sr,q);
endmodule
