module problem_2(clk,CLRn,M,N,q);
input clk,CLRn,M,N;
output reg q;

always @(negedge clk or posedge CLRn) begin
	if (CLRn== 1'b1)
		q<=0;
	else
		case({M,N})
		2'b00 : q<= ~q;
		2'b01 : q<=1;
		2'b10 : q<=0;
		2'b11 : q<=q;
		endcase
end
endmodule

//..............tb..............//
`timescale 1ns/1ns
module problem_2_tb;
reg clk,CLRn,M,N;
wire q;

problem_2 f(clk,CLRn,M,N,q);

integer i;
 always #10 clk = ~clk;
initial begin
	clk= 0;
	CLRn=1;
	
	
#10 CLRn=0;
#10 CLRn=1;
#10 CLRn=0;
end
initial begin
	for (i=0; i<5 ;i=i+1)
		#10 {M,N}=i;
end
initial begin
	$monitor("T=%0t |clk=%b |CLRn=%b| M =%b | N=%b |q=%b",$realtime,clk,CLRn,M,N,q);
end
endmodule

/*
# T=0 |clk=0 |CLRn=1| M =x | N=x |q=0
# T=10 |clk=1 |CLRn=0| M =0 | N=0 |q=0
# T=20 |clk=0 |CLRn=1| M =0 | N=1 |q=0
# T=30 |clk=1 |CLRn=0| M =1 | N=0 |q=0
# T=40 |clk=0 |CLRn=0| M =1 | N=1 |q=0
# T=50 |clk=1 |CLRn=0| M =0 | N=0 |q=0
# T=60 |clk=0 |CLRn=0| M =0 | N=0 |q=1
# T=70 |clk=1 |CLRn=0| M =0 | N=0 |q=1
# T=80 |clk=0 |CLRn=0| M =0 | N=0 |q=0
# T=90 |clk=1 |CLRn=0| M =0 | N=0 |q=0
*/
