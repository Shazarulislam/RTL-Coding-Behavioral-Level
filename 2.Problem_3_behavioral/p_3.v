module p_3(A,B,C,F,clk,E);
input A,B,C,F,clk;
output reg E;
reg D,G;
//.........................//

always@(posedge clk) begin
	D <= A & B & C;
	G <= (~A) & (~B);
	E <= D | G | F;
	end
endmodule

///Test bench
`timescale 1ns/1ns
//.........///

module p_3_tb;
reg A,B,C,F,clk;
wire E;

//............//

integer i;

//........................//
p_3 f(A,B,C,F,clk,E);

//.....if there is clk, clock enable, reset...........//

always #10 clk = ~clk ; // T =20

initial begin
	clk = 1'b0;
	end
//......for stop...............//	

initial begin
	#500 $stop;
	end
initial begin
	for (i=0; i< 64; i= i+1) begin
	#10 {A,B,C,F} = i;
	end
end

//...........system task......//
initial begin
$monitor ("T = %0t |clk=%b| A=%b | B= %b |C =%b | F =%b | E =%b",$realtime,clk,A,B,C,F,E);
end
endmodule
